within IBPSA.ThermalZones.ReducedOrder.Examples;
model SimpleRoomTwoElementsNonConstantTGround
  "Illustrates the use of non-constant ground temperature for equivalent air temperature calculation"
  extends Modelica.Icons.Example;
  extends IBPSA.ThermalZones.ReducedOrder.Examples.SimpleRoomTwoElements(eqAirTemp(
      wfWall={0.15,0.35},
      wfGro=0.5,
        TGroundFromInput=true));



  Modelica.Blocks.Sources.Trapezoid TGroTrapezoidSource(
    amplitude=10,
    rising=7884000,
    width=7884000,
    falling=7884000,
    period=31536000,
    offset=280.15,
    startTime=5184000) "Trapezoid-shaped source for ground temperature"
    annotation (Placement(transformation(extent={{-42,-52},{-22,-32}})));
equation

  connect(TGroTrapezoidSource.y, eqAirTemp.TGro_in)
    annotation (Line(points={{-21,-42},{-14,-42},{-14,-16}}, color={0,0,127}));
  annotation ( Documentation(info="<html>
<p>
This example shows the application of
<a href=\"IBPSA.ThermalZones.ReducedOrder.RC.TwoElements\">
IBPSA.ThermalZones.ReducedOrder.RC.TwoElements</a>
in connection with equivalent air temperature calculation in
<a href=\"IBPSA.ThermalZones.ReducedOrder.EquivalentAirTemperature.VDI6007WithWindow\">
IBPSA.ThermalZones.ReducedOrder.EquivalentAirTemperature.VDI6007WithWindow</a>,
where the ground temperature is not a constant, but has a trapezoid source.
Apart from that, it is identical to <a href=\"IBPSA.ThermalZones.ReducedOrder.Examples.SimpleRoomTwoElements\">
IBPSA.ThermalZones.ReducedOrder.Examples.SimpleRoomTwoElements</a>.
<h4>References</h4>
<p>VDI. German Association of Engineers Guideline VDI 6007-1
March 2012. Calculation of transient thermal response of rooms
and buildings - modelling of rooms.</p>
</html>",   revisions="<html>
<ul>
<li>
June 29, 2023, by Philip Groesdonk:<br/>
First implementation.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1744\">IBPSA, #1744</a>.
</li>
</ul>
</html>"),
  experiment(
      StopTime=31536000,
      Interval=3600,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
  __Dymola_Commands(file=
  "modelica://IBPSA/Resources/Scripts/Dymola/ThermalZones/ReducedOrder/Examples/SimpleRoomTwoElementsNonConstantTGround.mos"
        "Simulate and plot"),
    Diagram(coordinateSystem(extent={{-100,-120},{100,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
end SimpleRoomTwoElementsNonConstantTGround;
