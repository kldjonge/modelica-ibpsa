within IBPSA.Fluid.HeatPumps.ModularReversible.RefrigerantCycle;
model TableData2D "Performance data based on condenser outlet and evaporator inlet temperature"
  extends
    IBPSA.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.BaseClasses.PartialHeatPumpCycle(
    final datSou=datTab.devIde,
    mEva_flow_nominal=datTab.mEva_flow_nominal*scaFac,
    mCon_flow_nominal=datTab.mCon_flow_nominal*scaFac,
    final PEle_nominal=Modelica.Blocks.Tables.Internal.getTable2DValueNoDer2(
        tabIdePEle,
        TCon_nominal - 273.15,
        TEva_nominal - 273.15) * scaFac,
    QUseNoSca_flow_nominal=
        Modelica.Blocks.Tables.Internal.getTable2DValueNoDer2(
        tabIdeQUse_flow,
        TCon_nominal - 273.15,
        TEva_nominal - 273.15));
  extends
    IBPSA.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.BaseClasses.PartialTableData2D(
    final use_conOut=datTab.use_conOut,
    final use_evaOut=datTab.use_evaOut,
    perDevMasFloCon=(mCon_flow_nominal - datTab.mCon_flow_nominal*scaFac)/mCon_flow_nominal*100,
    perDevMasFloEva=(mEva_flow_nominal - datTab.mEva_flow_nominal*scaFac)/mEva_flow_nominal*100,
    constScaFac(final k=scaFac),
    tabQUse_flow(final table=datTab.tabQCon_flow),
    tabPEle(final table=datTab.tabPEle));


  parameter IBPSA.Fluid.HeatPumps.ModularReversible.Data.TableData2D.GenericHeatPump datTab=
      IBPSA.Fluid.HeatPumps.ModularReversible.Data.TableData2D.EN255.Vitocal350AWI114()
    "Data Table of HP" annotation (choicesAllMatching=true);

equation

  connect(scaFacTimPel.y, feeHeaFloEva.u2) annotation (Line(points={{-40,-11},{-40,
          -24},{-70,-24},{-70,-18}}, color={0,0,127}));
  connect(scaFacTimPel.y, PEle) annotation (Line(points={{-40,-11},{-40,-24},{0,
          -24},{0,-110}}, color={0,0,127}));
  connect(scaFacTimPel.y, redQCon.u2) annotation (Line(points={{-40,-11},{-40,-24},
          {64,-24},{64,-58}}, color={0,0,127}));
  connect(scaFacTimQUse_flow.y, feeHeaFloEva.u1) annotation (Line(points={{40,-11},
          {40,-18},{-86,-18},{-86,-10},{-78,-10}}, color={0,0,127}));
  connect(ySetTimScaFac.u1, sigBus.ySet) annotation (Line(points={{-64,48},{-64,
          94},{1,94},{1,104}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(reaPasThrTEvaOut.u, sigBus.TEvaOutMea) annotation (Line(points={{-20,
          102},{-20,104},{1,104}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(reaPasThrTEvaIn.u, sigBus.TEvaInMea) annotation (Line(points={{-50,
          102},{-50,106},{0,106},{0,104},{1,104}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(reaPasThrTConIn.u, sigBus.TConInMea) annotation (Line(points={{40,102},
          {40,104},{1,104}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(reaPasThrTConOut.u, sigBus.TConOutMea) annotation (Line(points={{70,
          102},{70,104},{1,104}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  annotation (Icon(graphics={
    Line(points={
          {-60.0,40.0},{-60.0,-40.0},{60.0,-40.0},{60.0,40.0},{30.0,40.0},
          {30.0,-40.0},{-30.0,-40.0},{-30.0,40.0},{-60.0,40.0},{-60.0,20.0},
          {60.0,20.0},{60.0,0.0},{-60.0,0.0},{-60.0,-20.0},{60.0,-20.0},
          {60.0,-40.0},{-60.0,-40.0},{-60.0,40.0},{60.0,40.0},{60.0,-40.0}}),
    Line(points={{0.0,40.0},{0.0,-40.0}}),
    Rectangle(fillColor={255,215,136},
      fillPattern=FillPattern.Solid,
      extent={{-60.0,20.0},{-30.0,40.0}}),
    Rectangle(fillColor={255,215,136},
      fillPattern=FillPattern.Solid,
      extent={{-60.0,0.0},{-30.0,20.0}}),
    Rectangle(fillColor={255,215,136},
      fillPattern=FillPattern.Solid,
      extent={{-60.0,-20.0},{-30.0,0.0}}),
    Rectangle(fillColor={255,215,136},
      fillPattern=FillPattern.Solid,
      extent={{-60.0,-40.0},{-30.0,-20.0}})}), Documentation(revisions="<html>
<ul>
  <li>
    <i>May 21, 2021</i> by Fabian Wuellhorst:<br/>
    Make use of BaseClasses (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/1092\">AixLib #1092</a>)
  </li>
  <li>
    <i>November 26, 2018</i> by Fabian Wuellhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/577\">AixLib #577</a>)
  </li>
</ul>
</html>", info="<html>
<p>
  This model uses two-dimensional table data typically given 
  by manufacturers as required by e.g. European Norm 14511 
  or ASHRAE XY to calculate
  <code>QCon_flow</code> and <code>PEle</code>.
</p>
<p>
  For different condenser outlet and evaporator inlet temperatures,
  the tables must provide two of the three following values:
  electrical power consumption, evaporator heat flow rate, and COP.
</p>
<p>
  Note that losses are often implicitly included in measured data.
  In this case, the frosting modules should be disabled.
</p>

<h4>Scaling factor</h4>
For the scaling factor, the table data for condenser heat flow rate
is evaluated at nominal conditions. Then, the table data is scaled linearly.
This implies a constant COP over different design sizes:
<p><code>QCon_flow = scaFac * tabQCon_flow.y</code> </p>
<p><code>PEle = scaFac * tabPel.y</code>


<h4>Known Limitations </h4>
<ul>
<li>
  Manufacturers are not required to provide the compressor speed at wich
  the data are measured. Thus, nominal values may be obtained at different
  compressor speeds and, thus, efficiencies.
  To accurately model the available thermal output, 
  please check that you use tables of the maximal thermal output, 
  which is often provided in the data sheets from the manufacturers. 
  This limitation only holds for inverter driven heat pumps.
</li>
<li>
  We assume that the efficiency is contant over the whole
  compressor speed range. Typically, effciencies will drop at minimal
  and maximal compressor speeds.
  To model an inverter controlled heat pump, the relative
  compressor speed <code>ySet</code> is used to scale
  the ouput of the tables linearly.
  For models including the compressor speed, check the SDF-Library
  dependent refrigerant cycle models in the
  <a href=\"https://github.com/RWTH-EBC/AixLib\">AixLib</a>.
</li>
</ul>
</html>"));
end TableData2D;
