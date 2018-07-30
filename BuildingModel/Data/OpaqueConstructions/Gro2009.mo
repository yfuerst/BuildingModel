within BuildingModel.Data.OpaqueConstructions;
record Gro2009 =
  Buildings.HeatTransfer.Data.OpaqueConstructions.Generic (
    nLay=6,
    absIR_a=0.95,
    absIR_b=0.95,
    absSol_a=0.6,
    absSol_b=0.6,
    material={
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.06,
        k=0.040,
        c=1000,
        d=140),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.25,
        k=2.3,
        c=1000,
        d=2300),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.04,
        k=0.035,
        c=1030,
        d=120),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.06,
        k=1.4,
        c=1000,
        d=2000),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.02,
        k=0.045,
        c=1030,
        d=120),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.06,
        k=1.4,
        c=1000,
        d=2000)}) "Ground floor: renovation level 2009"
annotation (
  defaultComponentPrefixes="parameter",
  defaultComponentName="datOpaCon");
