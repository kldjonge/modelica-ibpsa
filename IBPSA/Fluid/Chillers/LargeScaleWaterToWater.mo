within IBPSA.Fluid.Chillers;
model LargeScaleWaterToWater "Large scale water to water chiller"
  extends ModularReversible(
    final safCtrPar=safCtrParEurNor,
    dpEva_nominal=0,
    dpCon_nominal=0,
    final dTEva_nominal=QUse_flow_nominal/cpEva/mEva_flow_nominal,
    final dTCon_nominal=(QUse_flow_nominal - PEle_nominal)/cpCon/mCon_flow_nominal,
    redeclare package MediumCon = IBPSA.Media.Water,
    redeclare package MediumEva = IBPSA.Media.Water,
    final GEvaIns=0,
    final GEvaOut=0,
    final CEva=0,
    final use_evaCap=false,
    final GConIns=0,
    final GConOut=0,
    final CCon=0,
    final use_conCap=false,
    redeclare model RefrigerantCycleInertia =
        IBPSA.Fluid.HeatPumps.RefrigerantCycleModels.RefrigerantCycleInertias.NoInertia,
    redeclare model RefrigerantCycleChillerHeating =
        IBPSA.Fluid.HeatPumps.RefrigerantCycleModels.BaseClasses.NoHeating,
    redeclare model RefrigerantCycleChillerCooling =
        IBPSA.Fluid.Chillers.RefrigerantCycleModels.EuropeanNorm2D (redeclare
          IBPSA.Fluid.HeatPumps.RefrigerantCycleModels.Frosting.NoFrosting
          iceFacCal, datTab=datTab),
    final use_rev=false,
    final QHea_flow_nominal=0,
    final mCon_flow_nominal=autCalMasCon_flow,
    final mEva_flow_nominal=autCalMasEva_flow,
    final tauCon=autCalVCon*rhoCon/autCalMasCon_flow,
    final tauEva=autCalVEva*rhoEva/autCalMasEva_flow);

  extends IBPSA.Fluid.HeatPumps.BaseClasses.LargeScaleWaterToWaterParameters(
    final autCalMasCon_flow=max(5E-5*QUse_flow_nominal + 0.3161,
        autCalMMin_flow),
    final autCalMasEva_flow=max(5E-5*QUse_flow_nominal - 0.5662,
        autCalMMin_flow),
    final autCalVCon=max(2E-7*QUse_flow_nominal - 84E-4, autCalVMin),
    final autCalVEva=max(1E-7*QUse_flow_nominal - 66E-4, autCalVMin));
  replaceable parameter
    IBPSA.Fluid.Chillers.Data.EuropeanNorm2D.EN14511.Carrier30XWP1012_1MW
    datTab constrainedby Data.EuropeanNorm2D.Generic "Data Table of Chiller"
    annotation (choicesAllMatching=true);
  replaceable parameter
    IBPSA.Fluid.HeatPumps.Controls.Safety.RecordsCollection.DefaultHeatPumpSafetyControl
    safCtrParEurNor constrainedby
    IBPSA.Fluid.HeatPumps.Controls.Safety.RecordsCollection.PartialRefrigerantMachineSafetyControlBaseDataDefinition(
    final tabUppHea=datTab.tabLowBou,
    final tabLowCoo=datTab.tabLowBou,
    final use_TUseOut=datTab.use_TEvaOutForOpeEnv,
    final use_TNotUseOut=datTab.use_TConOutForOpeEnv)
    "Safety control parameters" annotation (Dialog(enable=
          use_internalSafetyControl, group="Safety Control"),
      choicesAllMatching=true);
    // Upper boundary has no influence as use_rev=false
  annotation (Documentation(info="<html>
<p>
  Model using parameters for a large scale water-to-water chiller,
  using the ModularReversible model approach.
</p>
<p>
  For more information on the approach, please read the 
  <a href=\"modelica://IBPSA.Fluid.HeatPumps.ModularReversibleUsersGuide\">
  UsersGuide</a>.
</p>
<p>
  Parameters are based on an automatic estimation, see: 
  <a href=\"modelica://IBPSA.Fluid.HeatPumps.BaseClasses.LargeScaleWaterToWaterParameters\">
  IBPSA.Fluid.HeatPumps.BaseClasses.LargeScaleWaterToWaterParameters</a>.
</p>
<p>
  Please read the documentation of the model for heating here: 
  <a href=\"modelica://IBPSA.Fluid.Chillers.RefrigerantCycleModels.EuropeanNorm2D\">
  IBPSA.Fluid.Chillers.RefrigerantCycleModels.EuropeanNorm2D</a>.
</p>
<p>
  Currently the only data sheets for chillers that large is the record 
  <a href=\"modelica://IBPSA.Fluid.Chillers.Data.EuropeanNorm2D.EN14511.Carrier30XWP1012_1MW\">
  IBPSA.Fluid.Chillers.RefrigerantCycleModels.EuropeanNorm2DData.EN14511.Carrier30XWP1012_1MW</a>, 
  hence, the default value.
</p>
<p>
  But you are free to insert custom data based on 
  the heat pump you want to analyze in your simulations.
</p>
<h4>Assumptions</h4>
<ul>
<li>
  As heat losses are implicitly included in the table 
  data according to EN 14511, heat losses are disabled.
</li>
<li>
  Pressure losses are not provided in datasheets. As typical 
  values are unknown, the pressure loss is set to 0 to enable 
  easier usage. However, the parameter is not final and should be
  replaced if mover power is of interest for your simulation aim.
</li>
</ul>   
</html>", revisions="<html><ul>
  <li>
    <i>Novemeber 11, 2022</i> by Fabian Wuellhorst:<br/>
    Implemented <a href=
    \"https://github.com/ibpsa/modelica-ibpsa/issues/1576\">#1576</a>)
  </li>
</ul>
</html>", revisions="<html><ul>
  <li>
    <i>Novemeber 11, 2022</i> by Fabian Wuellhorst:<br/>
    Implemented <a href=
    \"https://github.com/ibpsa/modelica-ibpsa/issues/1576\">#1576</a>)
  </li>
</ul>
</html>"));
end LargeScaleWaterToWater;
