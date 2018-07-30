within BuildingModel.Data.OpaqueConstructions;
record Int1984 =
  Buildings.HeatTransfer.Data.OpaqueConstructions.Generic (
    nLay=3,
    absIR_a=0.95,
    absIR_b=0.95,
    absSol_a=0.6,
    absSol_b=0.6,
    material={
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.0275,
        k=0.346,
        c=1000,
        d=1018.2),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.14,
        k=0.61,
        c=1593,
        d=93),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.0275,
        k=0.346,
        c=1000,
        d=1018.2)}) "Internal wall: renovation level 1984"
annotation (
  defaultComponentPrefixes="parameter",
  defaultComponentName="datOpaCon");
