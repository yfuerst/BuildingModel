within BuildingModel.Data.OpaqueConstructions;
record Int2009 =
  Buildings.HeatTransfer.Data.OpaqueConstructions.Generic (
    nLay=3,
    absIR_a=0.95,
    absIR_b=0.95,
    absSol_a=0.6,
    absSol_b=0.6,
    material={
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.015,
        k=0.51,
        c=1000,
        d=1200),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.145,
        k=0.5,
        c=1000,
        d=1000),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.015,
        k=0.51,
        c=1000,
        d=1200)}) "Internal wall: renovation level 2009"
annotation (
  defaultComponentPrefixes="parameter",
  defaultComponentName="datOpaCon");
