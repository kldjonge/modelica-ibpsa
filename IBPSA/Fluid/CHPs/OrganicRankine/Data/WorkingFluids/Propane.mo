within IBPSA.Fluid.CHPs.OrganicRankine.Data.WorkingFluids;
record Propane "Data record for propane (R290)"
  extends Generic(
    T = {
         263.15       ,273.898888889,284.647777778,295.396666667,
         306.145555556,316.894444444,327.643333333,338.392222222,
         349.141111111,359.89       },
    p = {
          345279.941449901, 485400.605038304, 664016.115440719,
          887052.541165123,1160724.363224234,1491611.619687285,
         1886825.956981318,2354347.829390035,2903681.060029375,
         3547408.027345188},
    rhoLiq = {
         541.798297226,527.579836833,512.585365108,496.632038772,
         479.466931165,460.721062294,439.816371148,415.748472388,
         386.451358179,346.106437325},
    dTRef = 30,
    sSatLiq = {
          908.965062614,1006.779440037,1103.648845716,1200.001618811,
         1296.323530695,1393.220337369,1491.541227233,1592.663453966,
         1699.311221116,1819.013862619},
    sSatVap = {
         2384.567612711,2371.574136657,2361.266030228,2352.732953327,
         2345.022612092,2337.032274329,2327.310860571,2313.560971451,
         2291.337848494,2249.306043938},
    sRef = {
         2566.79611772 ,2555.493081644,2547.750842968,2542.843699325,
         2540.115085679,2538.952119832,2538.763840737,2538.951963132,
         2538.886989404,2537.853328788},
    hSatLiq = {
         175348.350832337,201875.066749143,229271.052773913,
         257657.444992465,287189.506335636,318079.809438811,
         350645.399680575,385417.4820846  ,423455.88738496 ,
         467665.980896495},
    hSatVap = {
         563653.161890421,575690.817715341,587248.989642776,
         598170.43877048 ,608244.069220794,617168.568861843,
         624479.74824603 ,629363.595020986,630156.721875167,
         622523.83403136 },
    hRef = {
         614311.232841951,628792.518193016,643090.993507643,
         657134.020145737,670838.112039704,684105.52633736 ,
         696821.020909884,708845.675908959,720012.482475496,
         730115.169718242});
  annotation (
  defaultComponentPrefixes = "parameter",
  defaultComponentName = "pro",
  Documentation(info="<html>
<p>
Record containing properties of propane (R290).
Its name in CoolProp is \"Propane\".
A figure in the documentation of
<a href=\"Modelica://IBPSA.Fluid.CHPs.OrganicRankine.ConstantEvaporation\">
IBPSA.Fluid.CHPs.OrganicRankine.ConstantEvaporation</a>
shows which lines these arrays represent.
</p>
</html>"));
end Propane;