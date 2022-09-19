within IBPSA.Fluid.HeatExchangers;
model EvaporatorCondenserWithCapacity
  extends IBPSA.Fluid.Interfaces.TwoPortHeatMassExchanger(
    redeclare final IBPSA.Fluid.MixingVolumes.MixingVolume vol(
    final prescribedHeatFlowRate=true,
    final V=V),
    final tau=30);

  parameter Boolean is_con "Type of heat exchanger" annotation (Dialog( descriptionLabel = true),choices(choice=true "Condenser",
      choice=false "Evaporator",
      radioButtons=true));
  parameter Modelica.Units.SI.Volume V "Volume in condenser";
  parameter Boolean use_cap=true "False if capacity and heat losses are neglected"
    annotation (Dialog(group="Heat losses"),choices(checkBox=true));
  parameter Modelica.Units.SI.HeatCapacity C "Capacity of heat exchanger. If you want to neglace the dry mass of the heat exchanger, you can set this value to zero"
    annotation (Dialog(group="Heat losses", enable=use_cap));
  parameter Modelica.Units.SI.Temperature TCap_start=Medium.T_default
    "Initial temperature of heat capacity"
    annotation (Dialog(tab="Initialization", group="Capacity"));
  Modelica.Units.SI.ThermalConductance GOut
    "Formular for calculation of heat transfer coefficient on the outside. If you want to simulate a heat exchanger with additional dry mass but without external heat losses, set the value to zero"
                                                           annotation (Dialog(group=
          "Heat losses",                                                                           enable=use_cap));
  Modelica.Blocks.Interfaces.RealOutput GInn
    "Formular for calculation of heat transfer coefficient on the inside"
                                                                         annotation (Dialog(group=
          "Heat losses",                                                                                         enable=use_cap));
  Modelica.Thermal.HeatTransfer.Components.Convection conIns if use_cap
    "Convection between fluid and solid" annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={-10,30})));
  Modelica.Thermal.HeatTransfer.Components.Convection conOut if use_cap
    "Convection and conduction between solid and ambient air" annotation (
      Placement(transformation(
        extent={{12,12},{-12,-12}},
        rotation=270,
        origin={-10,70})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCap(
    final C=C,
    final T(
      final fixed=(energyDynamics == Modelica.Fluid.Types.Dynamics.FixedInitial),
      final start=TCap_start),
    final der_T(final fixed=(energyDynamics == Modelica.Fluid.Types.Dynamics.SteadyStateInitial),
        start=0)) if use_cap "Heat Capacity" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,50})));
  Modelica.Blocks.Sources.RealExpression heatLossIns(final y=GInn) if use_cap
    "Nominal heat loss coefficient to the inside" annotation (Placement(
        transformation(
        extent={{-20,-10},{20,10}},
        rotation=0,
        origin={-60,30})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_out if use_cap
    "Temperature and heat flow to the ambient"
    annotation (Placement(transformation(extent={{-5,105},{5,95}}),
        iconTransformation(extent={{-5,105},{5,95}})));
  Modelica.Blocks.Sources.RealExpression heatLossOut(final y=GOut) if use_cap
    "Nominal heat loss coefficient to the inside" annotation (Placement(
        transformation(
        extent={{-20,-10},{20,10}},
        rotation=0,
        origin={-60,70})));

  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow preHea(final alpha=0,
      final T_ref=293.15) "Heat flow rate of the condenser" annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={0,-70})));
  Modelica.Blocks.Interfaces.RealInput QFlow_in "Heat flow rate to the medium"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-118}), iconTransformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={-8.88178e-16,-106})));

  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor senT
    "Heat flow rate of the condenser" annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={50,-50})));
  Modelica.Blocks.Interfaces.RealOutput T(unit="K", displayUnit="degC")
    "Absolute temperature as output signal" annotation (Placement(
        transformation(extent={{100,-62},{124,-38}}), iconTransformation(extent=
           {{100,-62},{124,-38}})));
equation
  connect(conIns.fluid, heatCap.port)
    annotation (Line(points={{-10,42},{-10,50},{20,50}},  color={191,0,0},
      pattern=LinePattern.Dash));
  connect(heatCap.port, conOut.solid)
    annotation (Line(points={{20,50},{-10,50},{-10,58}},  color={191,0,0},
      pattern=LinePattern.Dash));
  connect(conIns.Gc, heatLossIns.y)
    annotation (Line(points={{-22,30},{-38,30}},   color={0,0,127},
      pattern=LinePattern.Dash));
  connect(conOut.fluid, port_out)
    annotation (Line(points={{-10,82},{-10,90},{0,90},{0,100}},
                                                  color={191,0,0},
      pattern=LinePattern.Dash));
  connect(conOut.Gc, heatLossOut.y)
    annotation (Line(points={{-22,70},{-38,70}},   color={0,0,127},
      pattern=LinePattern.Dash));
  connect(vol.heatPort, conIns.solid) annotation (Line(
      points={{-9,-10},{-14,-10},{-14,12},{-10,12},{-10,18}},
      color={191,0,0},
      pattern=LinePattern.Dash));
  connect(vol.heatPort, preHea.port) annotation (Line(points={{-9,-10},{-12,-10},
          {-12,-34},{0,-34},{0,-60},{1.77636e-15,-60}},   color={191,0,0}));
  connect(preHea.Q_flow, QFlow_in) annotation (Line(points={{-1.77636e-15,-80},
          {-1.77636e-15,-99},{0,-99},{0,-118}},color={0,0,127}));
  connect(senT.port, vol.heatPort) annotation (Line(points={{40,-50},{0,-50},{0,
          -34},{-12,-34},{-12,-10},{-9,-10}}, color={191,0,0}));
  connect(senT.T, T)
    annotation (Line(points={{61,-50},{112,-50}}, color={0,0,127}));
  annotation (Icon(graphics={ Ellipse(
          extent={{-48,46},{46,-42}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={170,213,255}),
        Rectangle(
          extent={{-18,100},{18,-100}},
          lineColor={0,0,0},
          fillColor={192,192,192},
          fillPattern=FillPattern.Backward,
          origin={0,68},
          rotation=90,
          visible=use_cap),
        Text(
          extent={{-36,52},{36,82}},
          textColor={0,0,0},
          pattern=LinePattern.Dash,
          fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          textString="C",
          visible=use_cap),
        Text(
          extent={{-36,-18},{36,12}},
          textColor={0,0,0},
          pattern=LinePattern.Dash,
          fillColor={255,215,136},
          fillPattern=FillPattern.Solid,
          textString="V"),
        Rectangle(
          extent={{-4,-42},{4,-50}},
          pattern=LinePattern.None,
          fillColor={191,0,0},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-107,5},{-44,-4}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          visible=is_con),
        Rectangle(
          extent={{44,-4},{100,5}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid,
          visible=is_con),
        Line(
          points={{0,-96},{0,-50},{0,-46}},
          color={0,0,0},
          pattern=LinePattern.None),
        Line(
          points={{-12,-76},{-12,-122},{50,-80},{82,-64},{4,-100}},
          color={0,0,0},
          pattern=LinePattern.None),
        Line(
          points={{-18,-70},{42,-44}},
          color={0,0,0},
          pattern=LinePattern.None),
        Rectangle(
          extent={{0,-98},{0,-48}},
          lineColor={238,46,47},
          pattern=LinePattern.None,
          fillColor={191,0,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-102,34},{-96,56},{-140,52},{-100,88},{-84,84},{-106,36}},
          color={238,46,47},
          pattern=LinePattern.None),
        Line(
          points={{-80,88},{-80,110},{-76,104},{-80,110},{-84,104}},
          color={28,108,200},
          visible=use_cap),
        Line(
          points={{-80,34},{-80,56},{-76,50},{-80,56},{-84,50}},
          color={238,46,47},
          visible=use_cap),
        Line(
          points={{-50,34},{-50,56},{-46,50},{-50,56},{-54,50}},
          color={238,46,47},
          visible=use_cap),
        Line(
          points={{-50,88},{-50,110},{-46,104},{-50,110},{-54,104}},
          color={28,108,200},
          visible=use_cap),
        Line(
          points={{80,34},{80,56},{84,50},{80,56},{76,50}},
          color={238,46,47},
          visible=use_cap),
        Line(
          points={{80,88},{80,110},{84,104},{80,110},{76,104}},
          color={28,108,200},
          visible=use_cap),
        Line(
          points={{50,88},{50,110},{54,104},{50,110},{46,104}},
          color={28,108,200},
          visible=use_cap),
        Line(
          points={{50,34},{50,56},{54,50},{50,56},{46,50}},
          color={238,46,47},
          visible=use_cap),
        Line(
          points={{20,34},{20,56},{24,50},{20,56},{16,50}},
          color={238,46,47},
          visible=use_cap),
        Line(
          points={{20,88},{20,110},{24,104},{20,110},{16,104}},
          color={28,108,200},
          visible=use_cap),
        Line(
          points={{-20,88},{-20,110},{-16,104},{-20,110},{-24,104}},
          color={28,108,200},
          visible=use_cap),
        Line(
          points={{-20,34},{-20,56},{-16,50},{-20,56},{-24,50}},
          color={238,46,47},
          visible=use_cap),
        Rectangle(
          extent={{-100,-4},{-44,5}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid,
          visible=not is_con),
        Rectangle(
          extent={{43,5},{106,-4}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          visible=not is_con)}), Documentation(revisions="<html><ul>
  <li>
    <i>November 26, 2018&#160;</i> by Fabian Wuellhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/577\">AixLib #577</a>)
  </li>
</ul>
</html>", info="<html>
<p>
  Model for an evaporator or condenser with the use of a capacity to
  simulate heat losses.
</p>
<p>
  Used in <a href=
  \"modelica://IBPSA.Fluid.HeatPumps.HeatPump\">IBPSA.Fluid.HeatPumps.HeatPump</a>,
  the heat flow to or from the volume is calculated in a black box.
  Thus the heat is directly added to the medium.
</p>
<p>
  In order to model transient states and inertias of a real heat pump,
  a capacity is added to the base model <a href=
  \"modelica://IBPSA.Fluid.Interfaces.TwoPortHeatMassExchanger\">TwoPortHeatMassExchanger</a>.
</p>
<p>
  The heat exchange between capacity and medium (<code>GIns</code>) is based on a series of heat
  resistances caused by forced convection and conduction through the
  capacity of the heat exchanger. Losses or gains in result of heat
  exchange with the ambient are modeled through the heat exchange
  coefficient <code>GOut</code> is
  represented by a series of conductive resistances and the convection
  to the ambient.
</p>
<p>
  Both parameters <code>GIns</code>
  and <code>GOut</code> are variable
  so that the calculation can follow a temperature or flow-rate based
  approach.
</p>
</html>"));
end EvaporatorCondenserWithCapacity;
