within BuildingModel.Data.OpaqueConstructions;
record Ext2009 =
  Buildings.HeatTransfer.Data.OpaqueConstructions.Generic (
    nLay=4,
    absIR_a=0.95,
    absIR_b=0.95,
    absSol_a=0.6,
    absSol_b=0.6,
    material={
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.05,
        k=1,
        c=1000,
        d=1800),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.1,
        k=0.035,
        c=1030,
        d=120),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.24,
        k=0.5,
        c=1000,
        d=1000),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.015,
        k=0.51,
        c=1000,
        d=1200)}) "External wall: renovation level 2009"
annotation (
  defaultComponentPrefixes="parameter",
  defaultComponentName="datOpaCon");
