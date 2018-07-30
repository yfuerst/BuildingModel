within BuildingModel.Data.OpaqueConstructions;
record Flo1984 =
  Buildings.HeatTransfer.Data.OpaqueConstructions.Generic (
    nLay=5,
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
        x=0.02,
        k=0.055,
        c=1030,
        d=120),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.06,
        k=1.4,
        c=1000,
        d=2000),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.04,
        k=0.084,
        c=1621,
        d=510),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.16,
        k=0.73,
        c=1593,
        d=93)}) "Intermediate floor: renovation level 1984"
annotation (
  defaultComponentPrefixes="parameter",
  defaultComponentName="datOpaCon");
