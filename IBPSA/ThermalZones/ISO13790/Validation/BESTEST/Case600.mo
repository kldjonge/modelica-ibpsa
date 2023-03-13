within IBPSA.ThermalZones.ISO13790.Validation.BESTEST;
model Case600 "Case 600FF, but with dual-setpoint for heating and cooling"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Math.Sum sumHeaCoo(nin=2)
    "Sum of heating and cooling heat flow rate"
    annotation (
    Placement(visible = true, transformation(extent={{54,36},{62,44}},      rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow preHeaCoo
    "Prescribed heat flow for heating and cooling"
    annotation (Placement(visible=true, transformation(extent={{68,34},{80,46}},
          rotation=0)));
  Modelica.Blocks.Math.Gain gaiHea(k=1E6) "Gain for heating"
    annotation (Placement(visible=true,
        transformation(
        origin={22,52},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  IBPSA.Controls.Continuous.LimPID conHeaPID(
    Ti=300,
    k=0.1,
    reverseActing=true,
    strict=true) "Controller for heating"
    annotation (Placement(visible=true, transformation(
        origin={0,52},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant TSetHea(k=273.15 + 20) "Set-point for heating"
    annotation (Placement(
        visible=true, transformation(
        origin={-24,52},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant TSetCoo(k=273.15 + 27) "Set-point for cooling"
    annotation (Placement(
        visible=true, transformation(
        origin={-24,26},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Modelica.Blocks.Routing.Multiplex2 multiplex2
    annotation (
    Placement(visible = true, transformation(extent={{38,36},{46,44}},      rotation = 0)));
  Modelica.Blocks.Math.Gain gaiCoo(k=-1E6) "Gain for cooling"
    annotation (Placement(visible=true,
        transformation(
        origin={22,26},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  IBPSA.Controls.Continuous.LimPID conCooPID(
    Ti=300,
    k=0.1,
    reverseActing=false,
    strict=true) "Controller for cooling"
    annotation (Placement(visible=true, transformation(
        origin={0,26},
        extent={{-6,-6},{6,6}},
        rotation=0)));
  Modelica.Blocks.Continuous.Integrator ECoo(
    k=1/3600000000,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    u(unit="W"),
    y(unit="J")) "Cooling energy in Joules"
    annotation (Placement(transformation(extent={{54,14},{66,26}})));
  Modelica.Blocks.Continuous.Integrator EHea(
    k=1/3600000000,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0,
    u(unit="W"),
    y(unit="J")) "Heating energy in Joules"
    annotation (Placement(transformation(extent={{54,56},{66,68}})));
  Modelica.Blocks.Sources.CombiTimeTable daiComBESTEST(table=[0,0,0,0,0,0,0,0;
        259200,0,0,0,0,0,0,0; 262800,3250,3800,3930,4130,3930,3770,4230; 266400,
        3410,3910,4040,4260,4040,3870,4350; 270000,3390,3870,4010,4230,4000,
        3900,4320; 273600,3380,3920,4040,4220,4000,3890,4310; 277200,3420,3940,
        4050,4220,4000,3920,4300; 280800,3430,3930,4040,4220,4000,3930,4310;
        284400,3420,3940,4050,4220,4000,3930,4310; 288000,3340,3700,3860,4090,
        3900,3750,4170; 291600,2770,2680,2560,2900,2710,2420,2910; 295200,1500,
        1380,840,1280,1150,800,1470; 298800,150,0,0,0,0,-30,0; 302400,-770,-1230,
        -1550,-1070,-1040,-1440,-420; 306000,-2660,-2490,-2850,-2590,-2500,-2720,
        -2360; 309600,-3580,-2960,-3400,-3230,-3090,-3160,-2760; 313200,-3530,-2630,
        -3120,-2830,-2640,-2840,-2430; 316800,-2440,-1350,-1820,-1550,-1350,-1720,
        -1140; 320400,-360,0,0,0,0,0,0; 324000,240,950,780,800,880,770,1290;
        327600,1530,2380,2230,2340,2330,2300,2450; 331200,2320,2870,2930,2990,
        2950,2970,2940; 334800,2640,3210,3320,3370,3310,3280,3410; 338400,2900,
        3280,3490,3530,3350,3460,3590; 342000,3020,3330,3510,3610,3490,3500,
        3700; 345600,3010,3390,3560,3660,3530,3470,3770; 345600,0,0,0,0,0,0,0;
        3153600,0,0,0,0,0,0,0]) "Daily comparison BESTEST"
    annotation (Placement(transformation(extent={{60,-80},{80,-60}})));
  Zone5R1C.Zone zon5R1C(
    airRat=0.414,
    AWin={0,0,12,0},
    UWin=3.095,
    AWal={21.6,16.2,9.6,16.2},
    ARoo=48,
    UWal=0.534,
    URoo=0.327,
    UFlo=0.0377,
    b=1,
    AFlo=48,
    VRoo=129.6,
    hInt=2.49,
    redeclare replaceable IBPSA.ThermalZones.ISO13790.Validation.BESTEST.Data.Case600Mass buiMas,
    nOrientations=4,
    surTil={1.5707963267949,1.5707963267949,1.5707963267949,1.5707963267949},
    surAzi={3.1415926535898,-1.5707963267949,0,1.5707963267949},
    gFac=0.769,
    coeFac={1,-0.189,0.644,-0.596})
    annotation (Placement(transformation(extent={{-14,-34},{14,-6}})));
  Modelica.Blocks.Sources.Constant intGai(k=200) "Internal heat gains"
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=
    Modelica.Utilities.Files.loadResource(
        "modelica://IBPSA/Resources/weatherdata/USA_CO_Denver.Intl.AP.725650_TMY3.mos"))
    "Weather data"
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  IBPSA.ThermalZones.ISO13790.Validation.BESTEST.Data.Case600Results annComBESTEST "Annual comparison BESTEST "
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  Buildings.Controls.OBC.CDL.Continuous.MovingAverage movAve(delta=3600)
    annotation (Placement(transformation(extent={{54,78},{66,90}})));
equation
  connect(sumHeaCoo.y,preHeaCoo. Q_flow)
    annotation (Line(points={{62.4,40},{68,40}}, color={0,0,127}));
  connect(conHeaPID.y,gaiHea. u)
    annotation (Line(points={{6.6,52},{14.8,52}}, color={0,0,127}));
  connect(TSetHea.y,conHeaPID. u_s)
    annotation (Line(points={{-17.4,52},{-7.2,52}},  color={0,0,127}));
  connect(multiplex2.y,sumHeaCoo. u) annotation (
    Line(points={{46.4,40},{53.2,40}},      color = {0, 0, 127}));
  connect(conCooPID.u_s,TSetCoo. y)
    annotation (Line(points={{-7.2,26},{-17.4,26}},  color={0,0,127}));
  connect(conCooPID.y,gaiCoo. u)
    annotation (Line(points={{6.6,26},{14.8,26}}, color={0,0,127}));
  connect(gaiHea.y,multiplex2. u1[1]) annotation (Line(points={{28.6,52},{32,52},
          {32,42},{38,42},{38,42.4},{37.2,42.4}},
                            color={0,0,127}));
  connect(gaiCoo.y,multiplex2. u2[1]) annotation (Line(points={{28.6,26},{32,26},
          {32,38},{38,38},{38,37.6},{37.2,37.6}},
                            color={0,0,127}));
  connect(gaiCoo.u,conCooPID. y)
    annotation (Line(points={{14.8,26},{6.6,26}}, color={0,0,127}));
  connect(EHea.u, gaiHea.y) annotation (Line(points={{52.8,62},{44,62},{44,52},
          {28.6,52}}, color={0,0,127}));
  connect(ECoo.u, gaiCoo.y) annotation (Line(points={{52.8,20},{44,20},{44,26},
          {28.6,26}}, color={0,0,127}));

  connect(preHeaCoo.port, zon5R1C.heaPorAir) annotation (Line(points={{80,40},{
          90,40},{90,-16},{4,-16},{4,-12}},
                                      color={191,0,0}));
  connect(intGai.y, zon5R1C.intSenGai) annotation (Line(points={{-59,-30},{-24,
          -30},{-24,-10},{-16,-10}}, color={0,0,127}));
  connect(weaDat.weaBus, zon5R1C.weaBus) annotation (Line(
      points={{-60,0},{10,0},{10,-9}},
      color={255,204,51},
      thickness=0.5));
  connect(zon5R1C.TAir, conCooPID.u_m) annotation (Line(points={{15,-12},{20,
          -12},{20,10},{0,10},{0,18.8}},
                                   color={0,0,127}));
  connect(zon5R1C.TAir, conHeaPID.u_m) annotation (Line(points={{15,-12},{20,
          -12},{20,10},{-40,10},{-40,40},{0,40},{0,44.8}},
                                                     color={0,0,127}));
  connect(movAve.u, gaiHea.y) annotation (Line(points={{52.8,84},{44,84},{44,52},
          {28.6,52}}, color={0,0,127}));
 annotation(experiment(
      StopTime=31536000,
      Interval=3600,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
  __Dymola_Commands(file=
  "modelica://IBPSA/Resources/Scripts/Dymola/ThermalZones/ISO13790/Validation/BESTEST/Case600.mos"
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
