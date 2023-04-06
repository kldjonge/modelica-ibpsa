within IBPSA.Fluid.HeatPumps.RefrigerantCycleModels.BaseClasses;
partial model PartialCarnot
  "Model with components for carnot efficiency calculation"

  parameter Boolean useAirForCon
    "Helper parameter to decide on good pinch assumptions on condenser side";
  parameter Boolean useAirForEva
    "Helper parameter to decide on good pinch assumptions on evaporator side";
  parameter Real quaGra=0.3 "Constant quality grade";
  parameter Modelica.Units.SI.TemperatureDifference TAppCon_nominal(min=0)=
    if useAirForCon then 5 else 2
    "Temperature difference between refrigerant and working fluid outlet in condenser"
    annotation (Dialog(group="Efficiency"));

  parameter Modelica.Units.SI.TemperatureDifference TAppEva_nominal(min=0)=
      if useAirForEva then 5 else 2
    "Temperature difference between refrigerant and working fluid outlet in evaporator"
    annotation (Dialog(group="Efficiency"));
  parameter Modelica.Units.SI.TemperatureDifference dTCarMin=20
    "Minimal temperature difference, used to avoid division errors"
     annotation(Dialog(tab="Advanced"));

  Modelica.Blocks.Sources.RealExpression reaEtaCarEff(final y=quaGra*
        addTVapCycUse.y/IBPSA.Utilities.Math.Functions.smoothMax(
        x1=dTCarMin,
        x2=(addTVapCycUse.y - addTVapCycNotUse.y),
        deltaX=0.25)) "Internal calculation of carnot efficiency"
    annotation (Placement(transformation(extent={{-90,38},{-70,58}})));
  Modelica.Blocks.Math.Product proQUse_flow "Calculate QUse_flow" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,40})));
  Modelica.Blocks.Math.Product proPEle "Calculate electrical power" annotation (
     Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={70,50})));
  Modelica.Blocks.Sources.Constant constPel
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={90,90})));
  Modelica.Blocks.Routing.RealPassThrough pasThrYSet "ySet from bus"
    annotation (Placement(transformation(extent={{20,60},{40,80}})));
  Modelica.Blocks.Math.Add addTVapCycNotUse(k1=+1, k2=+1)
    "Refrigerant cycle temperatur of not useful side " annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,70})));
  Modelica.Blocks.Math.Add addTVapCycUse(k1=+1, k2=+1)
    "Refrigerant cycle temperatur of useful side " annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,70})));
  Modelica.Blocks.Sources.Constant dTAppNotUse
    "Temperature difference at unuseful side"
    annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
  Modelica.Blocks.Sources.Constant dTAppUse
    "Temperature difference at useful side"
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Blocks.Sources.Constant constZero(final k=0)
                                             annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,10})));
  Modelica.Blocks.Logical.Switch switchPel
    "If HP is off, no heat will be exchanged" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={50,10})));
  Modelica.Blocks.Logical.Switch switchQUse
    "If HP is off, no heat will be exchanged" annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-50,10})));
equation
  connect(reaEtaCarEff.y, proQUse_flow.u2) annotation (Line(points={{-69,48},{-64,
          48},{-64,56},{-56,56},{-56,52}},
                                  color={0,0,127}));
  connect(proPEle.y, proQUse_flow.u1) annotation (Line(points={{70,39},{70,38},{
          -34,38},{-34,56},{-44,56},{-44,52}}, color={0,0,127}));
  connect(proPEle.u1, constPel.y) annotation (Line(points={{76,62},{76,72},{90,72},
          {90,79}}, color={0,0,127}));
  connect(pasThrYSet.y, proPEle.u2)
    annotation (Line(points={{41,70},{64,70},{64,62}}, color={0,0,127}));
  connect(dTAppNotUse.y, addTVapCycNotUse.u2)
    annotation (Line(points={{-39,90},{-36,90},{-36,82}}, color={0,0,127}));
  connect(dTAppUse.y, addTVapCycUse.u2)
    annotation (Line(points={{-79,90},{-76,90},{-76,82}}, color={0,0,127}));
  connect(constZero.y,switchPel. u3) annotation (Line(points={{8.88178e-16,21},{
          8.88178e-16,28},{42,28},{42,22}},
                        color={0,0,127}));
  connect(proPEle.y,switchPel. u1) annotation (Line(points={{70,39},{70,34},{58,
          34},{58,22}}, color={0,0,127}));
  connect(proQUse_flow.y,switchQUse. u1) annotation (Line(points={{-50,29},{-50,
          28},{-58,28},{-58,22}}, color={0,0,127}));
  connect(switchQUse.u3, constZero.y) annotation (Line(points={{-42,22},{-42,28},
          {8.88178e-16,28},{8.88178e-16,21}},         color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PartialCarnot;
