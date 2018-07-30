within BuildingModel.Data.OpaqueConstructions;
record Flo2009 =
  Buildings.HeatTransfer.Data.OpaqueConstructions.Generic (
    nLay=5,
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
        x=0.02,
        k=0.045,
        c=1030,
        d=120),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.06,
        k=1.4,
        c=1000,
        d=2000),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.01,
        k=0.045,
        c=1301,
        d=194),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.0125,
        k=0.25,
        c=1000,
        d=800)}) "Intermediate floor: renovation level 2009"
annotation (
  defaultComponentPrefixes="parameter",
  defaultComponentName="datOpaCon");
