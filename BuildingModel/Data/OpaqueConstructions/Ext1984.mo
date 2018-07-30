within BuildingModel.Data.OpaqueConstructions;
record Ext1984 =
  Buildings.HeatTransfer.Data.OpaqueConstructions.Generic (
    nLay=4,
    absIR_a=0.95,
    absIR_b=0.95,
    absSol_a=0.6,
    absSol_b=0.6,
    material={
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.03,
        k=1,
        c=1000,
        d=1800),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.02,
        k=0.18,
        c=1700,
        d=900),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.18,
        k=0.14,
        c=1445,
        d=127),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.0275,
        k=0.346,
        c=1000,
        d=1018.2)}) "External wall: renovation level 1984"
annotation (
  defaultComponentPrefixes="parameter",
  defaultComponentName="datOpaCon");
