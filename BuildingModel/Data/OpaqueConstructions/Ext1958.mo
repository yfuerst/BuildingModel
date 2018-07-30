within BuildingModel.Data.OpaqueConstructions;
record Ext1958 =
  Buildings.HeatTransfer.Data.OpaqueConstructions.Generic (
    nLay=4,
    absIR_a=0.95,
    absIR_b=0.95,
    absSol_a=0.6,
    absSol_b=0.6,
    material={
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.015,
        k=0.7,
        c=1100,
        d=1400),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.03,
        k=0.65,
        c=1700,
        d=1400),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.005,
        k=0.87,
        c=1000,
        d=1000),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.005,
        k=0.87,
        c=1000,
        d=1000)}) "External wall: renovation level 1958"
annotation (
  defaultComponentPrefixes="parameter",
  defaultComponentName="datOpaCon");
