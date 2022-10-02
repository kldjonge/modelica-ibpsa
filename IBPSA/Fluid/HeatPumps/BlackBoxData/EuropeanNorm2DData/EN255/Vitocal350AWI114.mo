within IBPSA.Fluid.HeatPumps.BlackBoxData.EuropeanNorm2DData.EN255;
record Vitocal350AWI114 "Vitocal 350 AWI 114"
  extends
    IBPSA.Fluid.HeatPumps.BlackBoxData.EuropeanNorm2DData.HeatPumpBaseDataDefinition(
    device_id="Vitocal350AWI114",
    tablePel=[0,-20,-15,-10,-5,0,5,10,15,20,25,30; 35,3295.500,3522.700,3750,
        3977.300,4034.100,4090.900,4204.500,4375,4488.600,4488.600,4545.500; 50,
        4659.100,4886.400,5113.600,5227.300,5511.400,5568.200,5738.600,5909.100,
        6022.700,6250,6477.300; 65,0,6875,7159.100,7500,7727.300,7897.700,
        7954.500,7954.500,8181.800,8409.100,8579.500],
    tableQCon_flow=[0,-20,-15,-10,-5,0,5,10,15,20,25,30; 35,9204.500,11136.40,
        11477.30,12215.90,13863.60,15056.80,16931.80,19090.90,21250,21477.30,
        21761.40; 50,10795.50,11988.60,12215.90,13068.20,14545.50,15681.80,
        17613.60,20284.10,22500,23181.80,23863.60; 65,0,12954.50,13465.90,
        14431.80,15965.90,17386.40,19204.50,21250,22897.70,23863.60,24886.40],
    mCon_flow_nominal=15400/4180/10,
    mEva_flow_nominal=1,
    tableUppBou=[-20,55; -5,65; 35,65]);

  annotation (Documentation(info="<html>
<p>Data for VitoCal350 air-to-water heat pump, around 11 kW </p>
</html>", revisions="<html>
<ul>
  <li>
    <i>November 26, 2018</i> by Fabian Wuellhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/577\">AixLib #577</a>)
  </li>
</ul>
</html>"));
end Vitocal350AWI114;
