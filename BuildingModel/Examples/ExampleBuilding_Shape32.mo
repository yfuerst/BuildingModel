within BuildingModel.Examples;
model ExampleBuilding_Shape32
  extends Examples.BaseClasses.BaseExample(
    final nRoo=4,
    final nGro=3,
    final A={22,32,12,32},
    final h={5.7,2.7,2.7,2.7},
    final airExRa=ones(nRoo),
    final haveRoof={true,false,true,true},
    final floorType={Types.FloorType.GroundFloor,Types.FloorType.GroundFloor,Types.FloorType.GroundFloor,Types.FloorType.IntermediateFloor});

  Building bui(
    nRoo=nRoo,
    AFlo=A,
    hRoo=h,
    nExtWalWin={4,2,2,3},
    AExtWalWin=[12,66,12,9; 12,24,0,0; 9,12,0,0; 12,24,12,0],
    hWin=[2,2,2,2; 2,2,0,0; 2,2,0,0; 2,2,2,0],
    wWin=[1,10,1,2; 3,7,0,0; 2,3,0,0; 3,7,3,0],
    aziExtWalWin=[Buildings.Types.Azimuth.N,Buildings.Types.Azimuth.W,Buildings.Types.Azimuth.S,
        Buildings.Types.Azimuth.E; Buildings.Types.Azimuth.N,Buildings.Types.Azimuth.E,
        0,0; Buildings.Types.Azimuth.E,Buildings.Types.Azimuth.S,0,0; Buildings.Types.Azimuth.N,
        Buildings.Types.Azimuth.E,Buildings.Types.Azimuth.S,0],
    rooCon=[0,1.2,2.1,3.1; 2.1,0,1.2,0; 1.2,2.1,0,0; 1.3,0,0,0],
    floCon=[0,0,0,0; 0,0,0,0; 0,0,0,0; 0,1,0,0],
    AIntWal=[24,9,24; 12,24,0; 9,12,0; 24,0,0],
    redeclare Data.OpaqueConstructions.Gro1958 gro,
    redeclare Data.OpaqueConstructions.Flo1958 flo,
    redeclare Data.OpaqueConstructions.Ext1958 ext,
    redeclare Data.OpaqueConstructions.Int1958 int,
    redeclare Data.OpaqueConstructions.Roof1958 roof,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    redeclare Buildings.HeatTransfer.Data.GlazingSystems.SingleClear3 glaSys,
    redeclare package Medium = MediumAir,
    nPorts=nPorts,
    lat=lat,
    haveRoof=haveRoof,
    floorType=floorType)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));

equation
  connect(bui.weaBus, weaBus) annotation (Line(
      points={{20,10},{30,10},{30,30},{40,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  for i in 1:nRoo loop
    connect(sin[i].ports[1], bui.ports[i, 2]) annotation (Line(points={{-60,10},
            {-50,10},{-50,-10},{-19.2,-10}},
                                  color={0,127,255}));
    connect(sou[i].ports[1], bui.ports[i, 1]) annotation (Line(points={{-40,-70},
            {-50,-70},{-50,-10},{-19.2,-10}},
                                  color={0,127,255}));
  end for;
  connect(groTem.port, bui.heaPorFlo)
    annotation (Line(points={{10,-40},{0,-40},{0,-20}}, color={191,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=36000));
end ExampleBuilding_Shape32;
