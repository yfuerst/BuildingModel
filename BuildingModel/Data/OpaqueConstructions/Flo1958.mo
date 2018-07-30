within BuildingModel.Data.OpaqueConstructions;
record Flo1958 =
  Buildings.HeatTransfer.Data.OpaqueConstructions.Generic (
    nLay=5,
    absIR_a=0.95,
    absIR_b=0.95,
    absSol_a=0.6,
    absSol_b=0.6,
    material={
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.1,
        k=0.045,
        c=1301,
        d=194),
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
        x=0.01,
        k=0.13,
        c=1600,
        d=500),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.06,
        k=1.4,
        c=1000,
        d=2000)}) "Intermediate floor: renovation level 1958"
annotation (
  defaultComponentPrefixes="parameter",
  defaultComponentName="datOpaCon");
