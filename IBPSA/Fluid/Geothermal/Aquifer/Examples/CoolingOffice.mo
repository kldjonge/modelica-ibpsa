within IBPSA.Fluid.Geothermal.Aquifer.Examples;
model CoolingOffice
  extends Modelica.Icons.Example;
  parameter Modelica.Units.SI.HeatFlowRate Qcoo=30000 "Cooling power";
  parameter Modelica.Units.SI.TemperatureDifference deltaT=4 "Temperature difference at heat exchanger";
  parameter Modelica.Units.SI.SpecificHeatCapacity cpWat=4186 "Heat capacity of water";
  parameter Modelica.Units.SI.MassFlowRate mWat=Qcoo/(deltaT*cpWat) "Nominal water mass flow rate";

  HeatExchangers.HeaterCooler_u hea(
    redeclare package Medium = IBPSA.Media.Water,
    m_flow_nominal=mWat,
    dp_nominal=100,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    Q_flow_nominal=Qcoo) "Heat exchanger"
    annotation (Placement(transformation(extent={{-12,32},{8,52}})));
  Modelica.Blocks.Sources.Constant watMas(k=1)    "Water mass flow rate"
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Sources.Constant heaFlo(k=1) "Cooling load"
    annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
  MultiWell aquWel(
    redeclare package Medium = IBPSA.Media.Water,
    nVol=80,
    h=20,
    r_max=500,
    T_ini_coo=285.15,
    T_ini_hot=285.15,
    aquDat=IBPSA.Fluid.Geothermal.Aquifer.Data.Rock(),
    m_flow_nominal=mWat,
    dp_nominal_aquifer(displayUnit="Pa") = 10,
    dp_nominal_well(displayUnit="Pa") = 10,
    dp_nominal_hex(displayUnit="Pa") = 100)
    annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
  Sources.Boundary_pT bou(redeclare package Medium = IBPSA.Media.Water, nPorts=
        1) annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
equation
  connect(heaFlo.y, hea.u) annotation (Line(points={{-39,70},{-22,70},{-22,48},
          {-14,48}},
        color={0,0,127}));
  connect(aquWel.port_a1, hea.port_b) annotation (Line(points={{3,10},{3,28},{
          12,28},{12,42},{8,42}},             color={0,127,255}));
  connect(aquWel.port_a, hea.port_a) annotation (Line(points={{-7,10},{-8,10},{
          -8,28},{-16,28},{-16,42},{-12,42}},
                                            color={0,127,255}));
  connect(bou.ports[1], hea.port_a) annotation (Line(points={{-60,30},{-16,30},
          {-16,42},{-12,42}},                  color={0,127,255}));
  connect(watMas.y, aquWel.u) annotation (Line(points={{-39,-10},{-22,-10},{-22,
          7},{-14,7}},                        color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=7776000,Tolerance=1e-6),
    __Dymola_Commands(file=
  "modelica://IBPSA/Resources/Scripts/Dymola/Fluid/Geothermal/Aquifer/Examples/CoolingOffice.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>
This example shows the application of the model
<a href=\"modelica://IBPSA.Fluid.Geothermal.Aquifer.SingleWell\">IBPSA.Fluid.Geothermal.Aquifer.SingleWell</a>.
</p>
<p>
The system consists of two wells, a warm well and a cold well. Water is extracted from the cold well at 12C and 
after passing through a heat exchanger it is injected in the warm well at 16C. This may represent the operation of an
aquifer thermal energy storage system that cools an office building with a constant load of 30 kW.
</p>

</html>", revisions="<html>
<ul>
<li>
May 2023, by Alessandro Maccarini:<br/>
First Implementation.
</li>
</ul>
</html>"));
end CoolingOffice;
