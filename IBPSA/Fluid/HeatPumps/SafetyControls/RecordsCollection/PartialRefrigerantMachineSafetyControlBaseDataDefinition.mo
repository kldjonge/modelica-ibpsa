within IBPSA.Fluid.HeatPumps.SafetyControls.RecordsCollection;
record PartialRefrigerantMachineSafetyControlBaseDataDefinition
  "Base data definition for refrigerant machines safety models"
  extends Modelica.Icons.Record;
  parameter Boolean use_minRunTime
    "False if minimal runtime of HP is not considered"
  annotation (Dialog(group="HP-Security: OnOffControl"), choices(checkBox=true));
  parameter Modelica.Units.SI.Time minRunTime
    "Mimimum runtime of heat pump" annotation (Dialog(group=
          "HP-Security: OnOffControl", enable=use_minRunTime));
  parameter Real ySetMin
    "Minimal relative compressor speed to be used if device needs to run longer"
        annotation (
          Dialog(group="HP-Security: OnOffControl",
          enable=use_minRunTime));
  parameter Boolean use_minLocTime
    "False if minimal locktime of HP is not considered"
    annotation (Dialog(group="HP-Security: OnOffControl"),
    choices(checkBox=true));
  parameter Modelica.Units.SI.Time minLocTime
    "Minimum lock time of heat pump" annotation (Dialog(group=
          "HP-Security: OnOffControl", enable=use_minLocTime));
  parameter Boolean use_runPerHou
    "False if maximal runs per hour HP are not considered"
    annotation (Dialog(group="HP-Security: OnOffControl"),
    choices(checkBox=true));
  parameter Integer maxRunPerHou
    "Maximal number of on/off cycles in one hour. Source: German law"
    annotation (Dialog(group="HP-Security: OnOffControl",
    enable=use_runPerHou));
  parameter Boolean use_opeEnv
    "Use a the operational envelope"
    annotation (
      Dialog(group="Operational Envelope", enable=use_opeEnv),
      choices(checkBox=true));
  parameter Real tabUppHea[:,2] "Upper envelope boundary for heating"
    annotation (
      Dialog(group="Operational Envelope",
      enable=use_opeEnv));
  parameter Real tabLowCoo[:,2] "Lower envelope boundary for cooling"
    annotation (
      Dialog(group="Operational Envelope",
      enable=use_opeEnv));
  parameter Modelica.Units.SI.TemperatureDifference dTHysOpeEnv=5
    "Temperature difference used for both upper 
    and lower hysteresis in the operational envelope."
    annotation (Dialog(group="Operational Envelope", enable=use_opeEnv));
  parameter Boolean use_TEvaInForOpeEnv=true
    "=true to use evaporator inlet temperature, false for outlet"
        annotation (Dialog(group="Operational Envelope", enable=use_opeEnv));
  parameter Boolean use_TConInForOpeEnv=false
    "=true to use codensner inlet temperature, false for outlet"
        annotation (Dialog(group="Operational Envelope", enable=use_opeEnv));
  parameter Boolean preYSet_start "Start value of pre(n) at initial time"
    annotation (
      Dialog(group="OnOffControl", descriptionLabel=true),
      choices(checkBox=true));

  parameter Boolean use_antFre
    "True if anti freeze control is part of safety control"
    annotation (Dialog(group="Anti Freeze Control"), choices(checkBox=true));
  parameter Modelica.Units.SI.ThermodynamicTemperature TAntFre
    "Limit temperature for anti freeze control"
    annotation (Dialog(group="Anti Freeze Control", enable=use_antFre));
  parameter Real dTHysAntFre
    "Hysteresis interval width for anti freeze control"
    annotation (Dialog(group="Anti Freeze Control", enable=use_antFre));
  parameter Boolean use_minFlowCtr
    "=false to disable minimal mass flow rate requirements"
    annotation (choices(checkBox=true), Dialog(group="Mass flow rates"));
  parameter Real m_flowEvaMinPer
    "Percentage of mass flow rate in evaporator required to operate the device"
    annotation (Dialog(group="Mass flow rates", enable=use_minFlowCtrl));
  parameter Real m_flowConMinPer
    "Percentage of mass flow rate in condenser required to operate the device"
    annotation (Dialog(group="Mass flow rates", enable=use_minFlowCtrl));
    annotation (Dialog(group="Operational Envelope", enable=use_opeEnv),
                Dialog(group="Operational Envelope", enable=use_opeEnv),
                 Dialog(group="Anti Freeze Control", enable=use_antFre),
                Dialog(group="Anti Freeze Control", enable=use_antFre),
    Icon(graphics, coordinateSystem(preserveAspectRatio=false)),
     Diagram(graphics, coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Base data definitions with parameters relevant for safety control of refrigerant machines. </p>
<p>Typically, datasheets of manufacturers provide specific values for these assumptions. </p>
</html>", revisions="<html><ul>
  <li>
    <i>October 2, 2022</i> by Fabian Wuellhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/ibpsa/modelica-ibpsa/issues/1576\">#1576</a>)
  </li>
</ul>
</html>
"));
end PartialRefrigerantMachineSafetyControlBaseDataDefinition;
