within IBPSA.BoundaryConditions.Validation.BESTEST;
model WD500
  "Test model for BESTEST weather data: time zone case"
  extends WD100(
    rho=0,
    weaDatHHorIR(
      filNam=Modelica.Utilities.Files.loadResource(
        "modelica://IBPSA/Resources/Data/BoundaryConditions/Validation/BESTEST/WD500.mos")),
    weaDatTDryBulTDewPoinOpa(
      filNam=Modelica.Utilities.Files.loadResource(
        "modelica://IBPSA/Resources/Data/BoundaryConditions/Validation/BESTEST/WD500.mos")));
  annotation (
    experiment(
      StopTime=3.1536e+07,
      Interval=900,
      Tolerance=1e-6),
    __Dymola_Commands(
      file="modelica://IBPSA/Resources/Scripts/Dymola/BoundaryConditions/Validation/BESTEST/WD500.mos" "Simulate and plot"),
    Documentation(
      revisions="<html>
<ul>
<li>
March 11, 2020, by Ettore Zanetti:<br/>
First implementation.
</li>
<li>
April 14, 2020, by Ettore Zanetti:<br/>
Rework after comments from pull request
<a href=\"https://github.com/ibpsa/modelica-ibpsa/pull/1339\">#1339</a>.
</li>
<li>
May 2, 2021, by Ettore Zanetti:<br/>
Updated weather file as explained in <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1478\">#1478</a>.
</li>
</ul>
</html>",
      info="<html>
<h4>WD500: Time Zone Case</h4>
<p>Weather data file : WD500.epw</p>
<p><i>Table 1: Site Data for Weather file WD500epw</i></p>
<table summary=\"Site Data for Weather file WD500epw\" cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p>Latitude</p></td>
<td><p>28.567&deg; north</p></td>
</tr>
<tr>
<td><p>Longitude</p></td>
<td><p>77.103&deg; east</p></td>
</tr>
<tr>
<td><p>Altitude</p></td>
<td><p>236.9 m</p></td>
</tr>
<tr>
<td><p>Time Zone</p></td>
<td><p>5.5</p></td>
</tr>
</table>
</html>"));
end WD500;
