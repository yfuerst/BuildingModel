within BuildingModel.Data.OpaqueConstructions;
record Roof1984 =
  Buildings.HeatTransfer.Data.OpaqueConstructions.Generic (
    nLay=6,
    absIR_a=0.95,
    absIR_b=0.95,
    absSol_a=0.6,
    absSol_b=0.6,
    material={
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.08,
        k=0.09,
        c=1367,
        d=155),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.0125,
        k=0.25,
        c=1000,
        d=800),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.015,
        k=0.51,
        c=1000,
        d=1200),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.18,
        k=0.084,
        c=1358,
        d=160),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.0125,
        k=0.25,
        c=1000,
        d=800),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.015,
        k=0.51,
        c=1000,
        d=1200)}) "Roof: renovation level 1984"
annotation (
  defaultComponentPrefixes="parameter",
  defaultComponentName="datOpaCon");
