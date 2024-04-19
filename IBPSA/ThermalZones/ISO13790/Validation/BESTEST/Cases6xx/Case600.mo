within IBPSA.ThermalZones.ISO13790.Validation.BESTEST.Cases6xx;
model Case600
  "Case 600FF, but with dual-setpoint for heating and cooling"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Math.Sum sumHeaCoo(nin=2)
    "Sum of heating and cooling heat flow rate"
    annotation (
    Placement(visible = true, transformation(extent={{54,56},{62,64}},      rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow preHeaCoo
    "Prescribed heat flow for heating and cooling"
    annotation (Placement(visible=true, transformation(extent={{68,54},{80,66}},
          rotation=0)));
  Modelica.Blocks.Math.Gain gaiHea(k=1E6) "Gain for heating"
    annotation (Placement(visible=true,
        transformation(
        origin={22,72},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  IBPSA.Controls.Continuous.LimPID conHeaPID(
    Ti=300,
    k=0.1,
    reverseActing=true,
    strict=true) "Controller for heating"
    annotation (Placement(visible=true, transformation(
        origin={0,72},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Modelica.Blocks.Sources.CombiTimeTable
                                   TSetHea(table=[0.0,273.15 + 20])
    "Set-point for heating"
    annotation (Placement(
        visible=true, transformation(
        origin={-24,72},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex2
    annotation (
    Placement(visible = true, transformation(extent={{38,56},{46,64}},      rotation = 0)));
  Modelica.Blocks.Math.Gain gaiCoo(k=-1E6) "Gain for cooling"
    annotation (Placement(visible=true,
        transformation(
        origin={22,46},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  IBPSA.Controls.Continuous.LimPID conCooPID(
    Ti=300,
    k=0.1,
    reverseActing=false,
    strict=true) "Controller for cooling"
    annotation (Placement(visible=true, transformation(
        origin={0,46},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Modelica.Blocks.Continuous.Integrator ECoo(
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    u(unit="W"),
    y(unit="J", displayUnit="J")) "Cooling energy in Joules"
    annotation (Placement(transformation(extent={{54,34},{66,46}})));
  Modelica.Blocks.Sources.CombiTimeTable daiLoaWinBESTEST(
    tableOnFile=true,
    tableName="tab1",
    fileName=
        "C:/Cdrive_fromOldPC_Dec2021/My_working/ISO13790_DataASHRAE/600.txt",
    columns={2,3,4,5,6,7},
    timeScale(displayUnit="s")) "Daily comparison BESTEST"
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  Zone5R1C.Zone zon5R1C(
    airRat=0.414,
    AWin={0,0,12,0},
    UWin=3.1,
    AWal={21.6,16.2,9.6,16.2},
    ARoo=48,
    UWal=0.53,
    URoo=0.33,
    UFlo=0.038,
    b=1,
    AFlo=48,
    VRoo=129.6,
    hInt=2.1,
    redeclare replaceable IBPSA.ThermalZones.ISO13790.Validation.BESTEST.Data.Case600Mass buiMas,
    nOrientations=4,
    surTil={1.5707963267949,1.5707963267949,1.5707963267949,1.5707963267949},
    surAzi={3.1415926535898,-1.5707963267949,0,1.5707963267949},
    gFac=0.769,
    coeFac={1,-0.189,0.644,-0.596})
    annotation (Placement(transformation(extent={{-14,-14},{14,14}})));

  Modelica.Blocks.Sources.Constant intGai(k=200) "Internal heat gains"
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
  BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=
    Modelica.Utilities.Files.loadResource(
        "modelica://IBPSA/Resources/weatherdata/USA_CO_Denver.Intl.AP.725650_TMY3.mos"))
    "Weather data"
    annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
  IBPSA.ThermalZones.ISO13790.Validation.BESTEST.Data.Case600Results annComBESTEST "Annual comparison BESTEST "
    annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
  Modelica.Blocks.Continuous.Integrator EHea(
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    u(unit="W"),
    y(unit="J", displayUnit="J")) "Cooling energy in Joules"
    annotation (Placement(transformation(extent={{54,74},{66,86}})));
  Modelica.Blocks.Math.Gain EHeaMWh(k=1/3600000000) "Gain for heating"
    annotation (Placement(visible=true,
        transformation(
        origin={82,80},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Modelica.Blocks.Math.Gain ECooMWh(k=1/3600000000) "Gain for heating"
    annotation (Placement(visible=true, transformation(
        origin={84,40},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Utilities.Math.MovingAverage                   PHea(delta=3600)
    "Hourly averaged heating power"
    annotation (Placement(transformation(extent={{34,84},{42,92}})));
  Utilities.Math.MovingAverage                   PHea1(delta=3600)
    "Hourly averaged heating power"
    annotation (Placement(transformation(extent={{38,22},{46,30}})));
  Modelica.Blocks.Math.Gain PCookW(k=1/1000) "Gain for heating" annotation (
      Placement(visible=true, transformation(
        origin={60,16},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Modelica.Blocks.Math.Gain PHeakW(k=1/1000) "Gain for heating" annotation (
      Placement(visible=true, transformation(
        origin={58,98},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Modelica.Blocks.Sources.CombiTimeTable daiLoaSumBESTEST(
    tableOnFile=true,
    tableName="tab1",
    fileName=
        "C:/Cdrive_fromOldPC_Dec2021/My_working/ISO13790_DataASHRAE/600summer.txt",
    columns={2,3,4,5,6,7},
    timeScale(displayUnit="s")) "Daily comparison BESTEST"
    annotation (Placement(transformation(extent={{60,-80},{80,-60}})));

  Modelica.Blocks.Sources.CombiTimeTable TSetCoo(table=[0.0,273.15 + 27])
    "Set-point for heating" annotation (Placement(visible=true, transformation(
        origin={-24,46},
        extent={{-6,-6},{6,6}},
        rotation=0)));
equation
  connect(sumHeaCoo.y,preHeaCoo. Q_flow)
    annotation (Line(points={{62.4,60},{68,60}}, color={0,0,127}));
  connect(conHeaPID.y,gaiHea. u)
    annotation (Line(points={{6.6,72},{14.8,72}}, color={0,0,127}));
  connect(multiplex2.y,sumHeaCoo. u) annotation (
    Line(points={{46.4,60},{53.2,60}},      color = {0, 0, 127}));
  connect(conCooPID.y,gaiCoo. u)
    annotation (Line(points={{6.6,46},{14.8,46}}, color={0,0,127}));
  connect(gaiHea.y,multiplex2. u1[1]) annotation (Line(points={{28.6,72},{32,72},
          {32,62},{38,62},{38,62.4},{37.2,62.4}},
                            color={0,0,127}));
  connect(gaiCoo.y,multiplex2. u2[1]) annotation (Line(points={{28.6,46},{32,46},
          {32,58},{38,58},{38,57.6},{37.2,57.6}},
                            color={0,0,127}));
  connect(gaiCoo.u,conCooPID. y)
    annotation (Line(points={{14.8,46},{6.6,46}}, color={0,0,127}));
  connect(ECoo.u, gaiCoo.y) annotation (Line(points={{52.8,40},{44,40},{44,46},
          {28.6,46}}, color={0,0,127}));

  connect(preHeaCoo.port, zon5R1C.heaPorAir) annotation (Line(points={{80,60},{
          90,60},{90,4},{4,4},{4,8}}, color={191,0,0}));
  connect(intGai.y, zon5R1C.intSenGai) annotation (Line(points={{-59,-10},{-30,
          -10},{-30,10},{-16,10}},   color={0,0,127}));
  connect(weaDat.weaBus, zon5R1C.weaBus) annotation (Line(
      points={{-60,20},{10,20},{10,11}},
      color={255,204,51},
      thickness=0.5));
  connect(zon5R1C.TAir, conCooPID.u_m) annotation (Line(points={{15,8},{20,8},{
          20,30},{0,30},{0,38.8}}, color={0,0,127}));
  connect(zon5R1C.TAir, conHeaPID.u_m) annotation (Line(points={{15,8},{20,8},{
          20,30},{-40,30},{-40,60},{0,60},{0,64.8}}, color={0,0,127}));
  connect(EHea.u, gaiHea.y) annotation (Line(points={{52.8,80},{44,80},{44,72},
          {28.6,72}}, color={0,0,127}));
  connect(EHeaMWh.u, EHea.y)
    annotation (Line(points={{74.8,80},{66.6,80}}, color={0,0,127}));
  connect(ECooMWh.u, ECoo.y)
    annotation (Line(points={{76.8,40},{66.6,40}}, color={0,0,127}));
  connect(TSetHea.y[1], conHeaPID.u_s)
    annotation (Line(points={{-17.4,72},{-7.2,72}}, color={0,0,127}));
  connect(TSetCoo.y[1], conCooPID.u_s)
    annotation (Line(points={{-17.4,46},{-7.2,46}}, color={0,0,127}));
  connect(gaiCoo.y, PHea1.u) annotation (Line(points={{28.6,46},{32,46},{32,26},
          {37.2,26}}, color={0,0,127}));
  connect(PHea.u, gaiHea.y) annotation (Line(points={{33.2,88},{28.6,88},{28.6,
          72}}, color={0,0,127}));
  connect(PHeakW.u, PHea.y) annotation (Line(points={{50.8,98},{46,98},{46,88},
          {42.8,88}}, color={0,0,127}));
  connect(PCookW.u, PHea1.y) annotation (Line(points={{52.8,16},{46.8,16},{46.8,
          26}}, color={0,0,127}));
 annotation(experiment(
      StopTime=31536000,
      Interval=3600,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
  __Dymola_Commands(file=
  "modelica://IBPSA/Resources/Scripts/Dymola/ThermalZones/ISO13790/Validation/BESTEST/Cases6xx/Case600.mos"
        "Simulate and plot"), Documentation(info="<html>
<p>
This model is used for the basic test case 600 of the BESTEST validation suite. 
Case 600 is a light-weight building with room temperature control set to <i>20</i>&deg;C 
for heating and <i>27</i>&deg;C for cooling. The room has no shade and a window that faces south. 
</p>
</html>", revisions="<html><ul>
<li>
Mar 16, 2022, by Alessandro Maccarini:<br/>
First implementation.
</li>
</ul></html>"));
end Case600;
