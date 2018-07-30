within BuildingModel.Examples;
model ExampleBuilding_Shape43
  extends Examples.BaseClasses.BaseExample(
    final nRoo=7,
    final nGro=4,
    final A={16,32,12,6,16,32,12},
    final h={2.7,2.7,2.7,2.7,2.7,2.7,2.7},
    final airExRa=ones(nRoo),
    final haveRoof={false,false,false,true,true,true,true},
    final floorType={Types.FloorType.GroundFloor,Types.FloorType.GroundFloor,Types.FloorType.GroundFloor,Types.FloorType.GroundFloor,Types.FloorType.IntermediateFloor,Types.FloorType.IntermediateFloor,Types.FloorType.IntermediateFloor});

  Building bui(
    nRoo=nRoo,
    AFlo=A,
    hRoo=h,
    nExtWalWin={2,2,2,2,2,3,3},
    AExtWalWin=[24,6,0; 12,24,0; 9,12,0; 6,9,0; 24,6,0; 12,24,12; 9,6,9],
    hWin=[2,2,0; 2,2,0; 2,2,0; 2,2,0; 2,2,0; 2,2,2; 2,2,2],
    wWin=[7,1,0; 3,7,0; 2,3,0; 1,2,0; 7,1,0; 3,7,3; 2,1,2],
    aziExtWalWin=[Buildings.Types.Azimuth.W,Buildings.Types.Azimuth.N,0;
        Buildings.Types.Azimuth.N,Buildings.Types.Azimuth.E,0; Buildings.Types.Azimuth.E,
        Buildings.Types.Azimuth.S,0; Buildings.Types.Azimuth.S,Buildings.Types.Azimuth.W,
        0; Buildings.Types.Azimuth.W,Buildings.Types.Azimuth.N,0; Buildings.Types.Azimuth.N,
        Buildings.Types.Azimuth.E,Buildings.Types.Azimuth.S; Buildings.Types.Azimuth.E,
        Buildings.Types.Azimuth.S,Buildings.Types.Azimuth.W],
    AIntWal=[24,6; 24,12; 9,12; 9,6; 24,6; 6,0; 24,0],
    rooCon=[0,1.1,2.2,0,0,0,0; 1.1,0,0,2.2,0,0,0; 2.2,0,0,1.1,0,0,0; 0,2.2,1.1,0,
        0,0,0; 0,0,0,0,0,1.1,2.1; 0,0,0,0,1.1,0,0; 0,0,0,0,1.2,0,0],
    floCon=[0,0,0,0,0,0,0; 0,0,0,0,0,0,0; 0,0,0,0,0,0,0; 0,0,0,0,0,0,0; 1,0,0,0,
        0,0,0; 0,1,0,0,0,0,0; 0,0,1,0,0,0,0],
    redeclare Data.OpaqueConstructions.Gro1958 gro,
    redeclare Data.OpaqueConstructions.Flo1958 flo,
    redeclare Data.OpaqueConstructions.Ext1958 ext,
    redeclare Data.OpaqueConstructions.Int1958 int,
    redeclare Data.OpaqueConstructions.Roof1958 roof,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    redeclare Buildings.HeatTransfer.Data.GlazingSystems.DoubleClearAir13Clear
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
end ExampleBuilding_Shape43;
