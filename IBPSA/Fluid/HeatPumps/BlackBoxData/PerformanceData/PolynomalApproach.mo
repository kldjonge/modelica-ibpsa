﻿within IBPSA.Fluid.HeatPumps.BlackBoxData.PerformanceData;
model PolynomalApproach
  "Calculating heat pump data based on a polynomal approach"
  extends
    IBPSA.Fluid.HeatPumps.BlackBoxData.PerformanceData.BaseClasses.PartialPerformanceData;

  replaceable function PolyData =
      IBPSA.Fluid.HeatPumps.BlackBoxData.Functions.Characteristics.PartialBaseFct
                                                                           "Function to calculate peformance Data" annotation(choicesAllMatching=true);
  Modelica.Blocks.Sources.RealExpression internal_Pel(final y=Char[1]*
        scalingFactor)                                                 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={46,50})));
  Modelica.Blocks.Sources.RealExpression internal_QCon(final y=Char[2]*
        scalingFactor)                                 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-54,48})));
  Modelica.Blocks.Logical.Switch       switchPel
    "If HP is off, no heat will be exchanged" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={42,-12})));
  Modelica.Blocks.Logical.Switch       switchQCon
    "If HP is off, no heat will be exchanged" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-60,-12})));
  Modelica.Blocks.Sources.Constant constZero(final k=0)
                                             annotation (Placement(
        transformation(
        extent={{-7,-7},{7,7}},
        rotation=270,
        origin={-23,13})));
  Modelica.Blocks.Routing.RealPassThrough passThroughYSet annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-34,74})));
  Modelica.Blocks.Routing.RealPassThrough passThroughTConOut annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-16,74})));
  Modelica.Blocks.Routing.RealPassThrough passThroughTEvaIn annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={0,74})));
  Modelica.Blocks.Routing.RealPassThrough passThroughMFlowEva annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={16,74})));
  Modelica.Blocks.Routing.RealPassThrough passThroughMFlowCon annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={32,74})));
protected
  Real Char[2];
equation
  Char =PolyData(
    passThroughYSet.y,
    passThroughTConOut.y,
    passThroughTEvaIn.y,
    passThroughMFlowCon.y,
    passThroughMFlowEva.y);
  connect(switchQCon.u3, constZero.y) annotation (Line(points={{-64.8,-4.8},{-64,
          -4.8},{-64,2},{-24,2},{-24,5.3},{-23,5.3}}, color={0,0,127}));
  connect(switchQCon.y, feedbackHeatFlowEvaporator.u1) annotation (Line(points={{-60,
          -18.6},{-60,-26},{-76,-26},{-76,-33.2}},      color={0,0,127}));
  connect(switchQCon.u1, internal_QCon.y) annotation (Line(points={{-55.2,-4.8},
          {-54,-4.8},{-54,37}}, color={0,0,127}));
  connect(constZero.y, switchPel.u3) annotation (Line(points={{-23,5.3},{-23,-4.8},
          {37.2,-4.8}}, color={0,0,127}));
  connect(switchPel.y, calcRedQCon.u2) annotation (Line(points={{42,-18.6},{42,-48},
          {78,-48},{78,-60.8},{76.4,-60.8}}, color={0,0,127}));
  connect(switchPel.y, Pel) annotation (Line(points={{42,-18.6},{42,-48},{0,-48},
          {0,-110}}, color={0,0,127}));
  connect(switchPel.u1, internal_Pel.y)
    annotation (Line(points={{46.8,-4.8},{46,-4.8},{46,39}}, color={0,0,127}));
  connect(switchPel.y, feedbackHeatFlowEvaporator.u2) annotation (Line(points={
          {42,-18.6},{42,-22},{-88,-22},{-88,-38},{-80.8,-38}}, color={0,0,127}));
  connect(switchPel.u2, sigBus.onOffMea) annotation (Line(points={{42,-4.8},{42,
          14},{0,14},{0,84},{1,84},{1,104}},            color={255,0,255}),
      Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(switchQCon.u2, sigBus.onOffMea) annotation (Line(points={{-60,-4.8},{-58,
          -4.8},{-58,28},{1,28},{1,104}},                color={255,0,255}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(passThroughYSet.u, sigBus.ySet) annotation (Line(points={{-34,81.2},{-34,
          104},{1,104}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(passThroughTConOut.u, sigBus.TConOutMea) annotation (Line(points={{-16,
          81.2},{-16,104},{1,104}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(passThroughTEvaIn.u, sigBus.TEvaInMea) annotation (Line(points={{1.33227e-15,
          81.2},{1,81.2},{1,104}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(passThroughMFlowEva.u, sigBus.m_flowEvaMea) annotation (Line(points={{
          16,81.2},{16,104},{1,104}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(passThroughMFlowCon.u, sigBus.m_flowConMea) annotation (Line(points={{
          32,81.2},{32,104},{1,104}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  annotation (Icon(graphics={
        Text(
          lineColor={0,0,255},
          extent={{-136,109},{164,149}},
          textString="%name"),
        Ellipse(
          lineColor = {108,88,49},
          fillColor = {255,215,136},
          fillPattern = FillPattern.Solid,
          extent={{-86,-96},{88,64}}),
        Text(
          lineColor={108,88,49},
          extent={{-90,-108},{90,72}},
          textString="f")}), Documentation(revisions="<html><ul>
  <li>
    <i>May 21, 2021ф</i> by Fabian Wüllhorst:<br/>
    Make use of BaseClasses (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/1092\">#1092</a>)
  </li>
  <li>
    <i>November 26, 2018&#160;</i> by Fabian Wüllhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/577\">#577</a>)
  </li>
</ul>
</html>", info="<html>
<p>
  This model is used to calculate the three values based on a
  functional approach. The user can choose between several functions or
  use their own.
</p>
<p>
  As the <a href=
  \"modelica://IBPSA.Fluid.HeatPumps.BaseClasses.Functions.Characteristics.PartialBaseFct\">
  base function</a> only returns the electrical power and the condenser
  heat flow, the evaporator heat flow is calculated with the following
  energy balance:
</p>
<p>
  <i>QEva = QCon - P_el</i>
</p>
</html>"));
end PolynomalApproach;
