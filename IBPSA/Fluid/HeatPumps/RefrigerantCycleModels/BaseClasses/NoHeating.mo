within IBPSA.Fluid.HeatPumps.RefrigerantCycleModels.BaseClasses;
model NoHeating
  "No heating, used to avoid warnings about partial model must be replaced"
  extends PartialHeatPumpRefrigerantCycle(
    PEle_nominal=0,
    redeclare final
      IBPSA.Fluid.HeatPumps.RefrigerantCycleModels.Frosting.NoFrosting
      iceFacCal,
      datSou="",
      QUseNoSca_flow_nominal=0,
      scaFac=0,
      y_nominal=0,
      mEva_flow_nominal=0,
      mCon_flow_nominal=0,
      dTEva_nominal=0,
      dTCon_nominal=0,
    TEva_nominal=273.15,
    TCon_nominal=273.15,
      QUse_flow_nominal=0);
  Modelica.Blocks.Sources.Constant constZer(final k=0)
    "No heating, hence, zero"
    annotation (Placement(transformation(extent={{-88,16},{-68,36}})));
equation
  connect(constZer.y, feeHeaFloEva.u1) annotation (Line(points={{-67,26},{-62,
          26},{-62,4},{-94,4},{-94,-10},{-78,-10}}, color={0,0,127}));
  connect(constZer.y, feeHeaFloEva.u2) annotation (Line(points={{-67,26},{-62,
          26},{-62,4},{-94,4},{-94,-10},{-84,-10},{-84,-24},{-70,-24},{-70,-18}},
        color={0,0,127}));
  connect(constZer.y, redQCon.u2) annotation (Line(points={{-67,26},{-62,26},{-62,
          4},{64,4},{64,-58}}, color={0,0,127}));
  connect(constZer.y, PEle)
    annotation (Line(points={{-67,26},{0,26},{0,-110}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>
  Using this model, the heat pump will always be off. 
  This option is mainly used to avoid warnings about 
  partial model which must be replaced.
</p>
</html>", revisions="<html><ul>
  <li>
    <i>October 2, 2022</i> by Fabian Wuellhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/ibpsa/modelica-ibpsa/issues/1576\">#1576</a>)
  </li>
</ul>
</html>"));
end NoHeating;
