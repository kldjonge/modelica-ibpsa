within IBPSA.Fluid.HeatPumps.Data.EuropeanNorm2D.EN14511;
record WAMAK_WaterToWater_150kW "150 kW water to water with R134a"
  extends IBPSA.Fluid.HeatPumps.Data.EuropeanNorm2D.GenericHeatPump(
    tabUppBou=[-5,82; 45,82],
    mEva_flow_nominal=24.17/3600*997,
    mCon_flow_nominal=13.60/3600*997,
    tabPEle=[
      0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,
        22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40;
      60,20150,20230,20300,20370,20430,20500,20560,20620,20670,20730,20780,
        20830,20880,20940,20990,21040,21090,21140,21190,21250,21300,21360,
        21410,21470,21530,21600,21660,21730,21810,21880,21960,22050,22130,
        22230,22320,22420;
      70,24450,24570,24670,24770,24870,24960,25050,25130,25210,25290,25360,
        25430,25500,25560,25620,25680,25730,25790,25840,25890,25940,25990,
        26040,26090,26140,26190,26240,26290,26340,26400,26450,26510,26560,
        26620,26690,26750;
      80,29460,29620,29780,29940,30080,30220,30350,30470,30590,30700,30810,
        30910,31010,31100,31190,31270,31350,31420,31490,31560,31620,31680,
        31740,31790,31850,31900,31950,32000,32040,32090,32130,32180,32220,
        32270,32310,32360],
    tabQCon_flow=[
      0,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,
        22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40;
      60,58030,59710,61440,63220,65040,66920,68860,70850,72900,75020,77190,
        79440,81750,84120,86570,89100,91700,94380,97130,99970,102890,105900,
        109000,112190,115470,118840,122310,125880,129550,133320,137200,141180,
        145270,149480,153790,158220;
      70,56420,57930,59470,61060,62680,64350,66060,67820,69640,71500,73410,
        75390,77420,79500,81660,83870,86150,88500,90920,93410,95980,98620,
        101350,104150,107030,110000,113060,116200,119430,122760,126190,129710,
        133330,137050,140870,144800;
      80,55020,56370,57740,59130,60570,62030,63530,65070,66650,68270,69930,
        71640,73400,75210,77070,78990,80960,82990,85080,87230,89450,91740,
        94090,96520,99010,101590,104240,106970,109780,112670,115650,118710,
        121870,125110,128450,131890],
    devIde="WAMAK_WaterToWaterr_150kW",
    use_conOut=true,
    use_evaOut=false);
  annotation (Documentation(info="<html>
<p>Data for large scale (150 kW) water-to-water heat pump from WAMAK with </p>
</html>", revisions="<html>
<ul><li>
  <i>October 2, 2022</i> by Fabian Wuellhorst:<br/>
  First implementation (see issue <a href=
  \"https://github.com/ibpsa/modelica-ibpsa/issues/1576\">#1576</a>)
</li></ul>
</html>"));
end WAMAK_WaterToWater_150kW;
