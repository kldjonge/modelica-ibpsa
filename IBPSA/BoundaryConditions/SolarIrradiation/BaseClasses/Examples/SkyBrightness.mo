within IBPSA.BoundaryConditions.SolarIrradiation.BaseClasses.Examples;
model SkyBrightness "Test model for sky brightness"
  extends Modelica.Icons.Example;
  IBPSA.BoundaryConditions.SolarIrradiation.BaseClasses.RelativeAirMass relAirMas
    "Relative air mass"
     annotation (Placement(transformation(extent={{10,26},{30,46}})));
  IBPSA.BoundaryConditions.SolarGeometry.ZenithAngle zen
    "Zenith angle"
    annotation (Placement(transformation(extent={{-26,20},{-6,40}})));
  IBPSA.BoundaryConditions.SolarIrradiation.BaseClasses.SkyBrightness skyBri
    "Sky brightness"
    annotation (Placement(transformation(extent={{60,-16},{80,4}})));
  IBPSA.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=
    Modelica.Utilities.Files.loadResource("modelica://IBPSA/Resources/weatherdata/USA_CA_San.Francisco.Intl.AP.724940_TMY3.mos"))
    "Weather data"
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
  IBPSA.BoundaryConditions.WeatherData.Bus weaBus "Weather data bus"
    annotation (Placement(
        transformation(extent={{-50,-20},{-30,0}}),iconTransformation(extent={{
            -22,-20},{-22,-20}})));
equation
  connect(zen.y, relAirMas.zen) annotation (Line(
      points={{-5,30},{8,30}},
      color={0,0,127}));
  connect(relAirMas.relAirMas, skyBri.relAirMas) annotation (Line(
      points={{31,36},{40,36},{40,0},{58,0}},
      color={0,0,127}));
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{-60,-10},{-40,-10}},
      color={255,204,51},
      thickness=0.5), Text(
      textString="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(weaBus.HDifHor, skyBri.HDifHor) annotation (Line(
      points={{-40,-10},{10,-10},{10,-6},{58,-6}},
      color={255,204,51},
      thickness=0.5), Text(
      textString="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(zen.weaBus, weaBus) annotation (Line(
      points={{-26,30},{-30,30},{-30,-10},{-40,-10}},
      color={255,204,51},
      thickness=0.5), Text(
      textString="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(weaBus.solTim, skyBri.solTim) annotation (Line(
      points={{-40,-10},{-40,-12},{58,-12}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(weaBus.alt, relAirMas.alt) annotation (Line(
      points={{-40,-10},{-40,50},{0,50},{0,42},{8,42}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  annotation (
Documentation(info="<html>
<p>
This example computes the sky brightness.
</p>
</html>", revisions="<html>
<ul>
<li>
May 2, 2021, by Ettore Zanetti:<br/>
Changed extraterrestrial radiation and added time dependent correlation.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1477\">IBPSA, #1477</a>.
</li>
<li>
July 07, 2010, by Wangda Zuo:<br/>
First implementation.
</li>
</ul>
</html>"),
experiment(Tolerance=1e-6, StopTime=8640000),
__Dymola_Commands(file="modelica://IBPSA/Resources/Scripts/Dymola/BoundaryConditions/SolarIrradiation/BaseClasses/Examples/SkyBrightness.mos"
        "Simulate and plot"));
end SkyBrightness;
