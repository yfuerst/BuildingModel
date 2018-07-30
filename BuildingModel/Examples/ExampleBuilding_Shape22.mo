within BuildingModel.Examples;
model ExampleBuilding_Shape22
  extends Examples.BaseClasses.BaseExample(
    final nRoo=4,
    final nGro=3,
    final A={24,32,15,39},
    final h=fill(2.7, nRoo),
    final airExRa=ones(nRoo),
    final haveRoof={false,true,false,true},
    final floorType={Types.FloorType.GroundFloor,Types.FloorType.GroundFloor,Types.FloorType.GroundFloor,BuildingModel.Types.FloorType.IntermediateFloor});

  Building bui(
    nRoo=nRoo,
    AFlo=A,
    hRoo=h,
    aziExtWal=[Buildings.Types.Azimuth.N; Buildings.Types.Azimuth.N; 0; 0],
    use_qGai_flow=true,
    redeclare Data.OpaqueConstructions.Gro1958 gro,
    redeclare Data.OpaqueConstructions.Flo1958 flo,
    redeclare Data.OpaqueConstructions.Ext1958 ext,
    redeclare Data.OpaqueConstructions.Int1958 int,
    redeclare Data.OpaqueConstructions.Roof1958 roof,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    redeclare
      Buildings.HeatTransfer.Data.GlazingSystems.TripleClearAir13ClearAir13Clear
      glaSys,
    nExtWal={1,1,0,0},
    AExtWal=[9; 12; 0; 0],
    nExtWalWin={1,2,3,4},
    AExtWalWin=[24,0,0,0; 24,12,0,0; 15,9,15,0; 39,12,39,12],
    hWin=[2,0,0,0; 2,2,0,0; 2,2,2,0; 2,2,2,2],
    wWin=[6,0,0,0; 6,2,0,0; 3,1,3,0; 10,1,10,1],
    aziExtWalWin=[Buildings.Types.Azimuth.W,0,0,0; Buildings.Types.Azimuth.E,
        Buildings.Types.Azimuth.S,0,0; Buildings.Types.Azimuth.E,Buildings.Types.Azimuth.S,
        Buildings.Types.Azimuth.W,0; Buildings.Types.Azimuth.W,Buildings.Types.Azimuth.N,
        Buildings.Types.Azimuth.E,Buildings.Types.Azimuth.S],
    rooCon=[0,1.1,2.1,0; 1.1,0,0,0; 1.2,0,0,0; 0,0,0,0],
    AIntWal=[24,9; 24,0; 9,0; 0,0],
    floCon=[0,0,0,0; 0,0,0,0; 0,0,0,0; 0.615,0,0.385,0],
    nPorts=nPorts,
    lat=lat,
    redeclare package Medium = MediumAir,
    haveRoof=haveRoof,
    floorType=floorType)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));

  Modelica.Blocks.Sources.RealExpression qGai_flow[4,3](y={{i*j for i in 1:3}
        for j in 1:4})
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));

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
  connect(qGai_flow.y, bui.qGai_flow) annotation (Line(points={{-39,40},{-30,40},
          {-30,6},{-22,6}}, color={0,0,127}));
  connect(bui.heaPorFlo, groTem.port) annotation (Line(points={{0,-20},{0,-20},{
          0,-38},{0,-40},{10,-40}}, color={191,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=3.1536e+07));
end ExampleBuilding_Shape22;
