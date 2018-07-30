within BuildingModel.Examples;
model ExampleSingleFloor
  extends Examples.BaseClasses.BaseExample(
    final nRoo=4,
    final A={16,32,12,6},
    final h={2.7,2.7,2.7,2.7},
    final airExRa=ones(nRoo),
    final haveRoof={true,true,false,false});

  SingleFloor sinFlo(
    nRoo=nRoo,
    hRoo=h,
    aziExtWalWin=[Buildings.Types.Azimuth.W,Buildings.Types.Azimuth.N;
        Buildings.Types.Azimuth.N,Buildings.Types.Azimuth.E; Buildings.Types.Azimuth.E,
        Buildings.Types.Azimuth.S; Buildings.Types.Azimuth.S,Buildings.Types.Azimuth.W],
    nExtWalWin={2,2,2,2},
    hWin=[2,2; 2,2; 2,2; 2,2],
    rooCon=[0,1.1,0,2.2; 1.1,0,2.2,0; 0,2.2,0,1.1; 2.2,0,1.1,0],
    AExtWalWin=[24,6; 12,24; 9,12; 6,9],
    wWin=[7,1; 3,7; 2,3; 1,2],
    AIntWal=[24,6; 24,12; 9,12; 9,6],
    redeclare Data.OpaqueConstructions.Gro1958 gro,
    redeclare Data.OpaqueConstructions.Flo1958 flo,
    redeclare Data.OpaqueConstructions.Ext1958 ext,
    redeclare Data.OpaqueConstructions.Int1958 int,
    redeclare Data.OpaqueConstructions.Roof1958 roof,
    redeclare package Medium = MediumAir,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    redeclare Buildings.HeatTransfer.Data.GlazingSystems.DoubleClearAir13Clear
      glaSys,
    AFlo=A,
    floCon=[0,0,0,0; 0,0,0,0; 0,0,0,0; 0,0,0,0],
    nPorts=nPorts,
    lat=lat,
    haveRoof=haveRoof)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));

equation
  connect(sinFlo.weaBus, weaBus) annotation (Line(
      points={{20,10},{30,10},{30,30},{40,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  for i in 1:nRoo loop
    connect(sin[i].ports[1],sinFlo.ports[i, 2]) annotation (Line(points={{-60,10},{-50,
          10},{-50,-10},{-19.2,-10}}, color={0,127,255}));
    connect(sou[i].ports[1],sinFlo.ports[i, 1]) annotation (Line(points={{-40,-70},{-50,
          -70},{-50,-10},{-19.2,-10}}, color={0,127,255}));
  end for;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=3.1536e+07));
end ExampleSingleFloor;
