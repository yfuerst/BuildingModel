within BuildingModel.Data.OpaqueConstructions;
record Gro1984 =
  Buildings.HeatTransfer.Data.OpaqueConstructions.Generic (
    nLay=6,
    absIR_a=0.95,
    absIR_b=0.95,
    absSol_a=0.6,
    absSol_b=0.6,
    material={
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.02,
        k=0.05,
        c=1000,
        d=100),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.25,
        k=2.3,
        c=1000,
        d=2300),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.04,
        k=0.055,
        c=1030,
        d=120),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.06,
        k=1.4,
        c=1000,
        d=2000),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.02,
        k=0.055,
        c=1030,
        d=120),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.06,
        k=1.4,
        c=1000,
        d=2000)}) "Ground floor: renovation level 1984"
annotation (
  defaultComponentPrefixes="parameter",
  defaultComponentName="datOpaCon");
