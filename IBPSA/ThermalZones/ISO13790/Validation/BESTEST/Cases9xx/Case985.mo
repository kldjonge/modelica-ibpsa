within IBPSA.ThermalZones.ISO13790.Validation.BESTEST.Cases9xx;
model Case985 "Case 900, but with single heating and cooling setpoint"
  extends Cases6xx.Case685(zon5R1C(redeclare
        IBPSA.ThermalZones.ISO13790.Validation.BESTEST.Data.Case900Mass buiMas));
end Case985;
