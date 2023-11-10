within IBPSA.Fluid.HeatPumps.ModularReversible.Data.TableData2D.EN14511;
record WAMAK_WaterToWater_220kW "220 kW water to water with R513A"
  extends
    IBPSA.Fluid.HeatPumps.ModularReversible.Data.TableData2D.GenericHeatPump(
    dpEva_nominal(displayUnit="kPa") = 40000,
    dpCon_nominal(displayUnit="kPa") = 40000,
    tabUppBou=[
        268.15, 328.15;
        273.15, 333.15;
        283.15, 343.15;
        293.15, 353.15],
    mEva_flow_nominal=27.35/3600*997,
    mCon_flow_nominal=29.07/3600*997,
    tabPEle=[0, 268.15, 269.15, 270.15, 271.15, 272.15, 273.15, 274.15, 275.15,
        276.15, 277.15, 278.15, 279.15, 280.15, 281.15, 282.15, 283.15, 284.15,
        285.15, 286.15, 287.15, 288.15, 289.15, 290.15, 291.15, 292.15, 293.15,
        294.15, 295.15, 296.15, 297.15, 298.15, 299.15, 300.15, 301.15, 302.15,
        303.15, 304.15, 305.15, 306.15, 307.15, 308.15, 309.15, 310.15, 311.15,
        312.15, 313.15, 314.15, 315.15, 316.15, 317.15, 318.15;
      328.15, 30100, 30100, 30100, 30100, 30100, 30100, 30100, 30100, 30100,
        30100, 30200, 30200, 30200, 30200, 30200, 30300, 30300, 30300, 30400,
        30400, 30400, 30500, 30500, 30600, 30600, 30700, 30700, 30800, 30800,
        30900, 31000, 31000, 31100, 31200, 31200, 31300, 31400, 31500, 31500,
        31600, 31700, 31800, 31900, 32000, 32100, 32200, 32300, 32400, 32500,
        32600, 32700;
      333.15, 0, 0, 0, 0, 0, 33500, 33500, 33500, 33500, 33500, 33500, 33500,
        33600, 33600, 33600, 33600, 33600, 33600, 33600, 33700, 33700, 33700,
        33700, 33800, 33800, 33900, 33900, 33900, 34000, 34000, 34100, 34100,
        34200, 34200, 34300, 34300, 34400, 34400, 34500, 34600, 34600, 34700,
        34800, 34900, 34900, 35000, 35100, 35200, 35300, 35400, 35400;
      343.15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41700, 41600, 41600,
        41600, 41600, 41600, 41600, 41600, 41600, 41600, 41600, 41600, 41600,
        41600, 41600, 41600, 41600, 41600, 41600, 41600, 41600, 41700, 41700,
        41700, 41700, 41700, 41800, 41800, 41800, 41900, 41900, 41900, 42000,
        42000, 42100, 42100;
      353.15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 51400, 51400, 51300, 51300, 51200, 51200, 51200, 51100,
        51100, 51000, 51000, 51000, 50900, 50900, 50900, 50800, 50800, 50800,
        50800, 50700, 50700, 50700, 50700, 50600, 50600, 50600],
    tabQCon_flow=[0, 268.15, 269.15, 270.15, 271.15, 272.15, 273.15, 274.15,
        275.15, 276.15, 277.15, 278.15, 279.15, 280.15, 281.15, 282.15, 283.15,
        284.15, 285.15, 286.15, 287.15, 288.15, 289.15, 290.15, 291.15, 292.15,
        293.15, 294.15, 295.15, 296.15, 297.15, 298.15, 299.15, 300.15, 301.15,
        302.15, 303.15, 304.15, 305.15, 306.15, 307.15, 308.15, 309.15, 310.15,
        311.15, 312.15, 313.15, 314.15, 315.15, 316.15, 317.15, 318.15;
      328.15, 65800, 68000, 70200, 72400, 74800, 77200, 79700, 82300, 84900,
        87700, 90500, 93400, 96400, 99500, 102600, 105900, 109300, 112800,
        116400, 120100, 123900, 127800, 131900, 136100, 140400, 144800, 149300,
        154000, 158800, 163800, 168900, 174100, 179500, 185000, 190700, 196600,
        202600, 208700, 215000, 221500, 228200, 235000, 242000, 249200, 256500,
        264100, 271800, 279700, 287800, 296100, 304600;
      333.15, 0, 0, 0, 0, 0, 75200, 77600, 80000, 82500, 85000, 87700, 90400,
        93200, 96100, 99100, 102100, 105300, 108600, 111900, 115400, 119000,
        122600, 126400, 130300, 134400, 138500, 142800, 147200, 151700, 156300,
        161100, 166100, 171100, 176300, 181700, 187200, 192800, 198600, 204600,
        210700, 217000, 223400, 230000, 236800, 243800, 250900, 258200, 265700,
        273400, 281200, 289300;
      343.15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 95000, 97700, 100500,
        103300, 106300, 109400, 112500, 115800, 119100, 122600, 126100, 129800,
        133600, 137500, 141500, 145600, 149900, 154300, 158800, 163500, 168200,
        173200, 178200, 183400, 188800, 194300, 199900, 205700, 211700, 217800,
        224100, 230600, 237200, 244000, 250900, 258100;
      353.15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 114300, 117300, 120500, 123700, 127000, 130500, 134100, 137700,
        141500, 145400, 149500, 153600, 157900, 162300, 166800, 171500, 176300,
        181300, 186400, 191700, 197100, 202600, 208300, 214200, 220200, 226400],
       devIde="WAMAK_TWW220_WHR_HeavyDuty",
    use_TConOutForTab=true,
    use_TEvaOutForTab=false);
  annotation (Documentation(info="<html>
<p>
  Data for large scale (220 kW) water-to-water heat pump from WAMAK. 
  Nominal pressure losses are the maximal values given in the datasheet,
  same for the nominal mass flow rates. 
</p>

<h4>References</h4>
<p>
WAMAK, Produktblatt ver. 2023/24.
<a href=\"https://products.wamak.eu/combine.php?&ampcoverpg&ampdescriptmrktadv&amplang=de-DE&ampcode_id=WAHDR2XE\">
https://products.wamak.eu/combine.php?&ampcoverpg&ampdescriptmrktadv&amplang=de-DE&ampcode_id=WAHDR2XE</a>.
</p>
</html>", revisions="<html>
<ul><li>
<i>November 10, 2023</i> by Fabian Wuellhorst:<br/>
  First implementation (see issue <a href=
  \"https://github.com/ibpsa/modelica-ibpsa/issues/1576\">#1576</a>)
</li></ul>
</html>"));
end WAMAK_WaterToWater_220kW;
