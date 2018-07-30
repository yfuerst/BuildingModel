within BuildingModel.Data.OpaqueConstructions;
record Roof1958 =
  Buildings.HeatTransfer.Data.OpaqueConstructions.Generic (
    nLay=6,
    absIR_a=0.95,
    absIR_b=0.95,
    absSol_a=0.6,
    absSol_b=0.6,
    material={
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.15,
        k=1.05,
        c=880,
        d=2400),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.005,
        k=0.87,
        c=1000,
        d=1400),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.005,
        k=0.87,
        c=1000,
        d=1400),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.025,
        k=0.04,
        c=830,
        d=20),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.075,
        k=1.4,
        c=1000,
        d=2000),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.075,
        k=1.4,
        c=1000,
        d=2000)}) "Roof: renovation level 1958"
annotation (
  defaultComponentPrefixes="parameter",
  defaultComponentName="datOpaCon");
