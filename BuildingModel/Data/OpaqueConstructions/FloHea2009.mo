within BuildingModel.Data.OpaqueConstructions;
record FloHea2009 =
  Buildings.HeatTransfer.Data.OpaqueConstructions.Generic (
    nLay=5,
    absIR_a=0.95,
    absIR_b=0.95,
    absSol_a=0.6,
    absSol_b=0.6,
    material={
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.08,
        k=1.13,
        c=1000,
        d=1400,
        nSta=5),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.05,
        k=0.04,
        c=1400,
        d=10),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.2,
        k=1.8,
        c=1100,
        d=2400),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.01,
        k=0.045,
        c=1301,
        d=194),
      Buildings.HeatTransfer.Data.Solids.Generic(
        x=0.0125,
        k=0.25,
        c=1000,
        d=800)}) "Heating floor: renovation level 2009"
annotation (
  defaultComponentPrefixes="parameter",
  defaultComponentName="datOpaCon");
