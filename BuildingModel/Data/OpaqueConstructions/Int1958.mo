within BuildingModel.Data.OpaqueConstructions;
record Int1958 =
  Buildings.HeatTransfer.Data.OpaqueConstructions.Generic (
    nLay=3,
    absIR_a=0.95,
    absIR_b=0.95,
    absSol_a=0.6,
    absSol_b=0.6,
    material={
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.01,
        k=0.87,
        c=1000,
        d=1400),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.12,
        k=0.3,
        c=1000,
        d=780),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.01,
        k=0.87,
        c=1000,
        d=1400)}) "Internal wall: renovation level 1958"
annotation (
  defaultComponentPrefixes="parameter",
  defaultComponentName="datOpaCon");
