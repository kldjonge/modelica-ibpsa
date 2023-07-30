within IBPSA.Fluid.HeatPumps.ModularReversible.Controls.Safety.Data;
record Wuellhorst2021
  "Apply the default values according to the conference publication by Wuellhorst et al. (2021)"
  extends Generic(
    tabLowCoo=[-10,10; 60,10],
    dTHysAntFre=2,
    preYSet_start=false,
    ySetRed=0.3,
    r_mConMinPer_flow=0.1,
    r_mEvaMinPer_flow=0.1,
    use_minFlowCtr=true,
    use_runPerHou=true,
    use_minLocTime=true,
    use_minRunTime=true,
    TAntFre=273.15,
    use_antFre=false,
    dTHysOpeEnv=5,
    use_opeEnv=true,
    tabUppHea=[-40,70; 40,70],
    maxRunPerHou=3,
    minLocTime=1200,
    minRunTime=600);
  annotation (Documentation(info="<html>
<p>
  Default values according to the conference publication
  by Wuellhorst et. al. <a href=\"https://doi.org/10.3384/ecp21181561\">
  https://doi.org/10.3384/ecp21181561</a>.
</p>
<p>
  These values are conservative estimates based on multiple datasheets.
</p>
</html>", revisions="<html><ul>
  <li>
    <i>October 2, 2022</i> by Fabian Wuellhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/ibpsa/modelica-ibpsa/issues/1576\">#1576</a>)
  </li>
</ul>
</html>
"));
end Wuellhorst2021;
