within BuildingModel.Examples;
model ExampleBuilding_Shape55
  extends Examples.BaseClasses.BaseExample(
    final nRoo=9,
    final nGro=5,
    final A={24,18,14,12,20,24,18,12,20},
    final h={2.7,2.7,5.7,2.7,2.7,2.7,2.7,2.7,2.7},
    final airExRa=ones(nRoo),
    final haveRoof={false,false,true,false,false,true,true,true,true},
    final floorType={Types.FloorType.GroundFloor,Types.FloorType.GroundFloor,Types.FloorType.GroundFloor,Types.FloorType.GroundFloor,Types.FloorType.GroundFloor,Types.FloorType.IntermediateFloor,Types.FloorType.IntermediateFloor,Types.FloorType.IntermediateFloor,Types.FloorType.IntermediateFloor});

  Building bui(
    nRoo=nRoo,
    AFlo=A,
    hRoo=h,
    nExtWal={0,1,1,0,0,0,1,0,0},
    AExtWal=[0; 4.5*3; 3.5*3; 0; 0; 0; 4.5*3; 0; 0],
    aziExtWal=[0; Buildings.Types.Azimuth.E; Buildings.Types.Azimuth.E; 0; 0; 0;
        Buildings.Types.Azimuth.E; 0; 0],
    nExtWalWin={2,1,0,2,2,2,1,2,2},
    AExtWalWin=[6*3,4*3; 4*3,0; 0,0; 3*3,4*3; 4*3,5*3; 6*3,4*3; 4*3,0; 3*3,4*3;
        4*3,5*3],
    hWin=[2,1; 1,0; 0,0; 1,1; 1,1; 2,1; 1,0; 1,1; 1,1],
    wWin=[4,2; 2,0; 0,0; 2,2; 2,3; 4,2; 2,0; 2,2; 2,3],
    aziExtWalWin=[Buildings.Types.Azimuth.W,Buildings.Types.Azimuth.N;
        Buildings.Types.Azimuth.N,Buildings.Types.Azimuth.E; 0,0; Buildings.Types.Azimuth.E,
        Buildings.Types.Azimuth.S; Buildings.Types.Azimuth.S,Buildings.Types.Azimuth.W;
        Buildings.Types.Azimuth.W,Buildings.Types.Azimuth.N; Buildings.Types.Azimuth.N,
        0; Buildings.Types.Azimuth.E,Buildings.Types.Azimuth.S; Buildings.Types.Azimuth.S,
        Buildings.Types.Azimuth.W],
    rooCon=[0,1.1,2.2,0,3.1,0,0,0,0; 1.1,0,2.1,0,0,0,0,0,0; 2.2,1.2,0,4.1,3.2,6.2,
        5.2,8.1,7.2; 0,0,1.4,0,2.3,0,0,0,0; 1.3,0,2.3,3.2,0,0,0,0,0; 0,0,2.6,0,0,
        0,1.1,0,3.1; 0,0,2.5,0,0,1.1,0,0,0; 0,0,1.8,0,0,0,0,0,2.3; 0,0,2.7,0,0,1.3,
        0,3.2,0],
    floCon=[0,0,0,0,0,0,0,0,0; 0,0,0,0,0,0,0,0,0; 0,0,0,0,0,0,0,0,0; 0,0,0,0,0,0,
        0,0,0; 0,0,0,0,0,0,0,0,0; 1,0,0,0,0,0,0,0,0; 0,1,0,0,0,0,0,0,0; 0,0,0,1,
        0,0,0,0,0; 0,0,0,0,1,0,0,0,0],
    AIntWal=[4.5*2.7,1.5*2.7,4*2.7,0,0,0,0,0; 4.5*2.7,4*2.7,0,0,0,0,0,0; 4*2.7,1.5
        *2.7,2*2.7,4*2.7,4*2.7,1.5*2.7,2*2.7,4*2.7; 4*2.7,3*2.7,0,0,0,0,0,0; 4*2.7,
        2*2.7,3*2.7,0,0,0,0,0; 4.5*2.7,1.5*2.7,4*2.7,0,0,0,0,0; 4.5*2.7,4*2.7,0,
        0,0,0,0,0; 4*2.7,3*2.7,0,0,0,0,0,0; 4*2.7,2*2.7,3*2.7,0,0,0,0,0],
    redeclare Data.OpaqueConstructions.Gro1958 gro,
    redeclare Data.OpaqueConstructions.Flo1958 flo,
    redeclare Data.OpaqueConstructions.Ext1958 ext,
    redeclare Data.OpaqueConstructions.Int1958 int,
    redeclare Data.OpaqueConstructions.Roof1958 roof,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    redeclare
      Buildings.HeatTransfer.Data.GlazingSystems.TripleClearAir13ClearAir13Clear
      glaSys,
    redeclare package Medium = MediumAir,
    nPorts=nPorts,
    lat=lat,
    haveRoof=haveRoof,
    floorType=floorType)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));

equation
  connect(bui.weaBus, weaDat.weaBus) annotation (Line(
      points={{20,10},{20,10},{30,10},{30,30},{60,30}},
      color={255,204,51},
      thickness=0.5));
  connect(groTem.port, bui.heaPorFlo) annotation (Line(points={{10,-40},{0,-40},{0,-20}}, color={191,0,0}));
  for i in 1:nRoo loop
    connect(sin[i].ports[1], bui.ports[i, 2]) annotation (Line(points={{-60,10},
            {-50,10},{-50,-10},{-19.2,-10}},
                                  color={0,127,255}));
    connect(sou[i].ports[1], bui.ports[i, 1]) annotation (Line(points={{-40,-70},
            {-50,-70},{-50,-10},{-19.2,-10}},
                                  color={0,127,255}));
  end for;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=36000));
end ExampleBuilding_Shape55;
