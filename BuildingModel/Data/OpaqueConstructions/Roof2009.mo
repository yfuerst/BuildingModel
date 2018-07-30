within BuildingModel.Data.OpaqueConstructions;
record Roof2009 =
  Buildings.HeatTransfer.Data.OpaqueConstructions.Generic (
    nLay=6,
    absIR_a=0.95,
    absIR_b=0.95,
    absSol_a=0.6,
    absSol_b=0.6,
    material={
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.1,
        k=0.45,
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
        x=0.22,
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
        d=1200)}) "Roof: renovation level 2009"
annotation (
  defaultComponentPrefixes="parameter",
  defaultComponentName="datOpaCon");
