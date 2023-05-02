within IBPSA.Fluid.HeatPumps.SafetyControls.BaseClasses;
block TimeControl
  "Counts seconds a device is turned on and 
  returns true if the time is inside given boundaries"
  extends Modelica.Blocks.Interfaces.BooleanSISO;

  parameter Modelica.Units.SI.Time minRunTime
    "Minimal time the device is turned on or off";
  Modelica.Blocks.Logical.Timer runTim
    "Counts the seconds the heat pump is locked still"
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold runTimGreMin(final threshold=
        minRunTime) "Checks if the runtime is greater than the minimal runtime"
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
equation
  connect(runTimGreMin.y, y)
    annotation (Line(points={{41,0},{110,0}}, color={255,0,255}));
  connect(u,runTim. u) annotation (
    Line(points={{-120,0},{-42,0}}, color={255,0,255}));
  connect(runTim.y, runTimGreMin.u)
    annotation (Line(points={{-19,0},{18,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false),
    graphics={
      Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
        Ellipse(extent={{-80,80},{80,-80}}, lineColor={160,160,164}),
        Line(points={{0,80},{0,60}}, color={160,160,164}),
        Line(points={{80,0},{60,0}}, color={160,160,164}),
        Line(points={{0,-80},{0,-60}}, color={160,160,164}),
        Line(points={{-80,0},{-60,0}}, color={160,160,164}),
        Line(points={{37,70},{26,50}}, color={160,160,164}),
        Line(points={{70,38},{49,26}}, color={160,160,164}),
        Line(points={{71,-37},{52,-27}}, color={160,160,164}),
        Line(points={{39,-70},{29,-51}}, color={160,160,164}),
        Line(points={{-39,-70},{-29,-52}}, color={160,160,164}),
        Line(points={{-71,-37},{-50,-26}}, color={160,160,164}),
        Line(points={{-71,37},{-54,28}}, color={160,160,164}),
        Line(points={{-38,70},{-28,51}}, color={160,160,164}),
        Line(
          points={{0,0},{-50,50}},
          thickness=0.5),
        Line(
          points={{0,0},{40,0}},
          thickness=0.5)}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html><p>
  When the input is true, a timer thats counting seconds until it is
  false again. As long as the counted time is smaller than a given
  minimal time, the block yields false.
</p>
<p>
  This block is used to check the mimimal run- or loctime of a device.
</p>
</html>", revisions="<html><ul>
  <li>
    <i>October 2, 2022</i> by Fabian Wuellhorst:<br/>
    Renaming according to IBPSA guideline (see issue <a href=
    \"https://github.com/ibpsa/modelica-ibpsa/issues/1576\">#1576</a>)
  </li>
  <li>
    <i>November 26, 2018</i> by Fabian Wuellhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/577\">AixLib #577</a>)
  </li>
</ul>
</html>"));
end TimeControl;
