within IBPSA.Fluid.PlugFlowPipes.BaseClasses;
model PipeLosslessPlugFlow
  "Lossless pipe model with spatialDistribution plug flow implementation"
  extends IBPSA.Fluid.Interfaces.PartialTwoPort;

  parameter Modelica.SIunits.Length dh
    "Hydraulic diameter (assuming a round cross section area)";
  parameter Modelica.SIunits.Length length(min=0) "Pipe length";
  final parameter Modelica.SIunits.Area A=Modelica.Constants.pi*(dh/2)^2
    "Cross-sectional area of pipe";

  // Advanced
  // Note: value of dp_start shall be refined by derived model,
  // based on local dp_nominal
  parameter Medium.AbsolutePressure dp_start=0
    "Guess value of dp = port_a.p - port_b.p"
    annotation (Dialog(tab="Advanced"));
  parameter Medium.MassFlowRate m_flow_start=0
    "Guess value of m_flow = port_a.m_flow" annotation (Dialog(tab="Advanced"));
  // Note: value of m_flow_small shall be refined by derived model,
  // based on local m_flow_nominal
  parameter Medium.MassFlowRate m_flow_small
    "Small mass flow rate for regularization of zero flow"
    annotation(Dialog(tab = "Advanced"));
  parameter Modelica.SIunits.Temperature T_start_in=Medium.T_default
    "Initial temperature in pipe at inlet"
    annotation (Dialog(group="Initialization"));
  parameter Modelica.SIunits.Temperature T_start_out=Medium.T_default
    "Initial temperature in pipe at outlet"
    annotation (Dialog(group="Initialization"));


  // Diagnostics
  parameter Boolean show_T = true
    "= true, if temperatures at port_a and port_b are computed"
    annotation(Dialog(tab="Advanced",group="Diagnostics"));

  Modelica.SIunits.Length x(start=0)
    "Spatial coordinate for spatialDistribution operator";
  Modelica.SIunits.Velocity v "Flow velocity of medium in pipe";

  // Variables
  Medium.MassFlowRate m_flow(min=if allowFlowReversal then -Modelica.Constants.inf
         else 0, start=m_flow_start) "Mass flow rate in design flow direction";
  Modelica.SIunits.Pressure dp(start=dp_start)
    "Pressure difference between port_a and port_b (= port_a.p - port_b.p)";

  Modelica.SIunits.VolumeFlowRate V_flow=
      m_flow/Modelica.Fluid.Utilities.regStep(m_flow,
                  Medium.density(
                    Medium.setState_phX(
                      p = port_a.p,
                      h = inStream(port_a.h_outflow),
                      X = inStream(port_a.Xi_outflow))),
                  Medium.density(
                       Medium.setState_phX(
                         p = port_b.p,
                         h = inStream(port_b.h_outflow),
                         X = inStream(port_b.Xi_outflow))),
                  m_flow_small)
    "Volume flow rate at inflowing port (positive when flow from port_a to port_b)";

  Medium.Temperature port_a_T=
      Modelica.Fluid.Utilities.regStep(port_a.m_flow,
                  Medium.temperature(
                    Medium.setState_phX(
                      p = port_a.p,
                      h = inStream(port_a.h_outflow),
                      X = inStream(port_a.Xi_outflow))),
                  Medium.temperature(Medium.setState_phX(port_a.p, port_a.h_outflow, port_a.Xi_outflow)),
                  m_flow_small) if show_T
    "Temperature close to port_a, if show_T = true";
  Medium.Temperature port_b_T=
      Modelica.Fluid.Utilities.regStep(port_b.m_flow,
                  Medium.temperature(
                    Medium.setState_phX(
                      p = port_b.p,
                      h = inStream(port_b.h_outflow),
                      X = inStream(port_b.Xi_outflow))),
                  Medium.temperature(Medium.setState_phX(port_b.p, port_b.h_outflow, port_b.Xi_outflow)),
                  m_flow_small) if show_T
    "Temperature close to port_b, if show_T = true";

protected
  parameter Modelica.SIunits.SpecificEnthalpy h_default=Medium.specificEnthalpy(
      sta_default) "Specific enthalpy";
  parameter Medium.ThermodynamicState sta_default=Medium.setState_pTX(
      T=Medium.T_default,
      p=Medium.p_default,
      X=Medium.X_default);
  parameter Modelica.SIunits.Density rho_default=Medium.density_pTX(
      p=Medium.p_default,
      T=Medium.T_default,
      X=Medium.X_default)
    "Default density (e.g., rho_liquidWater = 995, rho_air = 1.2)";
  parameter Modelica.SIunits.SpecificEnthalpy h_ini_in=Medium.specificEnthalpy(
      Medium.setState_pTX(
      T=T_start_in,
      p=Medium.p_default,
      X=Medium.X_default)) "For initialization of spatialDistribution inlet";

  parameter Modelica.SIunits.SpecificEnthalpy h_ini_out=Medium.specificEnthalpy(
       Medium.setState_pTX(
      T=T_start_out,
      p=Medium.p_default,
      X=Medium.X_default)) "For initialization of spatialDistribution outlet";

initial equation
  x = 0;

equation
  // Pressure drop in design flow direction
  dp = port_a.p - port_b.p;
  dp = 0;

  // Design direction of mass flow rate
  m_flow = port_a.m_flow;
  assert(m_flow > -m_flow_small or allowFlowReversal,
    "Reverting flow occurs even though allowFlowReversal is false");


  // Mass balance (no storage)
  port_a.m_flow + port_b.m_flow = 0;

  der(x) = v;
  v = V_flow/A;

  // fixme: this also need to be applied on Xi_outflow and C_outflow.
  // Otherwise, for air, it can give wrong temperatures at the outlet.
  // To assign Xi_outflow and C_outflow, you will need to use IBPSA.Fluid.Interfaces.PartialTwoPort
  (port_a.h_outflow,port_b.h_outflow) = spatialDistribution(
    inStream(port_a.h_outflow),
    inStream(port_b.h_outflow),
    x/length,
    v >= 0,
    {0.0, 1.0},
    {h_ini_in, h_ini_out});

  // Transport of substances
  port_a.Xi_outflow = if allowFlowReversal then inStream(port_b.Xi_outflow)
     else Medium.X_default[1:Medium.nXi];
  port_b.Xi_outflow = inStream(port_a.Xi_outflow);

  port_a.C_outflow = if allowFlowReversal then inStream(port_b.C_outflow) else
    zeros(Medium.nC);
  port_b.C_outflow = inStream(port_a.C_outflow);

  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={
        Line(
          points={{-72,-28}},
          color={0,0,0},
          pattern=LinePattern.Dash,
          thickness=0.5,
          smooth=Smooth.None),
        Rectangle(
          extent={{-100,60},{100,-60}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Rectangle(
          extent={{-100,50},{100,-48}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={217,236,256}),
        Rectangle(
          extent={{-20,50},{20,-48}},
          lineColor={175,175,175},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={175,175,175})}),
    Documentation(revisions="<html>
<ul>
<li>
May 19, 2016 by Marcus Fuchs:<br/>
Remove condition on <code>show_V_flow</code> for calculation of <code>V_flow</code> to conform with pedantic checking.
</li>
<li>
October 10, 2015 by Marcus Fuchs:<br/>
Copy Icon from KUL implementation and rename model.
</li>
<li>
June 23, 2015 by Marcus Fuchs:<br/>
First implementation.
</li>
</ul>
</html>", info="<html>
<p>A simple model to account for the effect of the temperature propagation of a fluid flow through a pipe. This propagation is guided by the simple one-dimensional wave equation (see below) without source or sink terms. It uses the <code>spatialDistribution</code> operator to delay changes in input enthalpy depending on the flow velocity.</p>
<h4>Main equation</h4>
<p align=\"center\"><i>&part;z(x,t)/&part;t + v(t) &part;z(x,t)/&part;x = 0,</i></p>
<p>where <i>z(x,t)</i> is the spatial distribution as a function of time of any property <i>z</i> of the fluid. For the temperature propagation, <i>z </i>will be replaced by <i>T</i>. </p>
<h4>Assumptions</h4>
<ul>
<li>The effect of axial diffusion in water is assumed to be negligibe</li>
<li>The water temperature is assumed uniform in a cross section</li>
</ul>
</html>"));
end PipeLosslessPlugFlow;
