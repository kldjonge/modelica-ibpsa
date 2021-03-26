within IBPSA.Airflow.Multizone.BaseClasses;
partial model PartialOneWayFlowElement
  "Partial model for flow resistance with one-way flow"
  extends IBPSA.Fluid.Interfaces.PartialTwoPortInterface(
    final allowFlowReversal=true);

  extends IBPSA.Airflow.Multizone.BaseClasses.ErrorControl;

  parameter Boolean useDefaultProperties=true
    "Set to false to use density and viscosity based on actual medium state, rather than using default values"
    annotation(Evaluate=true, Dialog(tab="Advanced"));
  parameter Modelica.SIunits.PressureDifference dp_turbulent(min=0, displayUnit="Pa") = 0.1
    "Pressure difference where laminar and turbulent flow relation coincide. Recommended = 0.1"
    annotation(Dialog(tab="Advanced"));

  // fixme : homotopy was changed to a constant in IBPSA issue #1341, PR #1342
  parameter Boolean homotopyInitialization = true "= true, use homotopy method"
    annotation(Evaluate=true, Dialog(tab="Advanced"));

  Modelica.SIunits.VolumeFlowRate V_flow
    "Volume flow rate through the component";
  Modelica.SIunits.Density rho "Fluid density at port_a";

protected
  parameter Medium.ThermodynamicState sta_default=Medium.setState_pTX(
      T=Medium.T_default,
      p=Medium.p_default,
      X=Medium.X_default)
    "State of the medium at the medium default properties";
  parameter Modelica.SIunits.Density rho_default=Medium.density(sta_default)
    "Density at the medium default properties";
  parameter Modelica.SIunits.DynamicViscosity dynVis_default=
    Medium.dynamicViscosity(sta_default)
    "Dynamic viscosity at the medium default properties";

  Medium.ThermodynamicState sta "State of the medium in the component";
  Modelica.SIunits.DynamicViscosity dynVis "Dynamic viscosity";
  Real mExc(quantity="Mass", final unit="kg")
    "Air mass exchanged (for purpose of error control only)";

initial equation
  mExc=0;

equation
  if forceErrorControlOnFlow then
    der(mExc) = port_a.m_flow;
  else
    der(mExc) = 0;
  end if;

  if useDefaultProperties then
    sta = sta_default;
    rho = rho_default;
    dynVis = dynVis_default;

  else
    sta = if homotopyInitialization then
        Medium.setState_phX(
          port_a.p,
          homotopy(
            actual=actualStream(port_a.h_outflow),
            simplified=inStream(port_a.h_outflow)),
          homotopy(
            actual=actualStream(port_a.Xi_outflow),
            simplified=inStream(port_a.Xi_outflow)))
      else
        Medium.setState_phX(
          port_a.p,
          actualStream(port_a.h_outflow),
          actualStream(port_a.Xi_outflow));

    rho = Medium.density(sta);
    dynVis = Medium.dynamicViscosity(sta);
  end if;

  // Isenthalpic state transformation (no storage and no loss of energy)
  port_a.h_outflow = inStream(port_b.h_outflow);
  port_b.h_outflow = inStream(port_a.h_outflow);

  // Mass balance (no storage)
  port_a.m_flow + port_b.m_flow = 0;

  // Transport of substances
  port_a.Xi_outflow = inStream(port_b.Xi_outflow);
  port_b.Xi_outflow = inStream(port_a.Xi_outflow);

  port_a.C_outflow = inStream(port_b.C_outflow);
  port_b.C_outflow = inStream(port_a.C_outflow);

  //relation between massflow and volumeflow
  m_flow=V_flow*rho;

  annotation (
    Documentation(info="<html>
<p>This partial model is used to model one way flow-elements. It holds the conservation equations and should be extended by definition of <u><b>one</b></u> of the following variables:</p>
<p><span style=\"font-family: Courier New;\">m_flow = mass flow rate trough the component</span></p>
<p><span style=\"font-family: Courier New;\">or</span></p>
<p><span style=\"font-family: Courier New;\">V_flow = volume flow rate through the component</span></p>
<p><br>The flow from A-&gt;B is the positive flow. This partial model can be used as a base for the interzonal air flow models. </p>
</html>",
revisions="<html>
<ul>
<li>
Jun 26, 2020, by Klaas De Jonge:<br/>
First implementation. PartialOneWayFlowelement serves as a baseclass for a clean implementation of m_flow and V_flow models
</li>
</ul>
</html>"));
end PartialOneWayFlowElement;
