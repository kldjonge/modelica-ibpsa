within IBPSA.Fluid.Examples.Tutorial.SimpleHouse;
model SimpleHouse3 "Air model"
  extends SimpleHouse2;

  parameter Modelica.Units.SI.Volume V_zone=8*8*3 "Zone volume";
  parameter Modelica.Units.SI.MassFlowRate mAir_flow_nominal=1
    "Nominal mass flow rate for air loop";
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer h_wall=2
    "Convective heat transfer coefficient at the wall";

  Modelica.Thermal.HeatTransfer.Components.ThermalResistor convRes(R=1/2/A_wall)
    "Thermal resistance for convective heat transfer"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={130,20})));
  MixingVolumes.MixingVolume zone(
    redeclare package Medium = MediumAir,
    V=V_zone,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    m_flow_nominal=mAir_flow_nominal)
    "Very simple zone air model"
    annotation (Placement(transformation(extent={{110,130},{90,150}})));
equation
  connect(convRes.port_b, walCap.port)
    annotation (Line(points={{130,10},{130,1.77636e-15},{140,1.77636e-15}},
                                                            color={191,0,0}));
  connect(zone.heatPort, convRes.port_a)
    annotation (Line(points={{110,140},{130,140},{130,30}}, color={191,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-240,
            -220},{200,200}})),
    experiment(StopTime=1e+06),
    Documentation(revisions="<html>
<ul>
<li>
September 4, 2023, by Jelger Jansen:<br/>
First implementation.
</li>
</ul>
</html>", info="<html>
<p>
This part of the model adds an air model which represents the room in the building.
</p>
</html>"),
    __Dymola_Commands(file=
          "modelica://IBPSA/Resources/Scripts/Dymola/Fluid/Examples/Tutorial/SimpleHouse/SimpleHouse3.mos"
        "Simulate and plot"));
end SimpleHouse3;
