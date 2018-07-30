within BuildingModel.Examples;
model ExampleBuilding_Shape21
  extends Examples.BaseClasses.BaseExample(
    final nRoo=3,
    final A={20,30,42},
    final h=fill(2.7, nRoo),
    final airExRa=0.5*ones(nRoo));

  Building bui(
    nRoo=nRoo,
    hRoo=h,
    AFlo=A,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    nExtWal={1,1,0},
    AExtWal=[4*2.7; 5*2.7; 0],
    aziExtWal=[Buildings.Types.Azimuth.E; Buildings.Types.Azimuth.S; 0],
    nExtWalWin={2,1,3},
    AExtWalWin=[5*2.7,4*2.7,0; 6*2.7,0,0; 7*2.7,6*2.7,7*2.7],
    hWin=[1.5,1.5,0; 1.5,0,0; 1.5,1.5,1.5],
    wWin=[3,2,0; 4,0,0; 2,3,4],
    aziExtWalWin=[Buildings.Types.Azimuth.N,Buildings.Types.Azimuth.W,0;
        Buildings.Types.Azimuth.W,0,0; Buildings.Types.Azimuth.N,Buildings.Types.Azimuth.E,
        Buildings.Types.Azimuth.S],
    redeclare Data.OpaqueConstructions.Gro2009 gro,
    redeclare Data.OpaqueConstructions.Flo2009 flo,
    redeclare Data.OpaqueConstructions.Ext2009 ext,
    redeclare Data.OpaqueConstructions.Int2009 int,
    redeclare Data.OpaqueConstructions.Roof2009 roof,
    rooCon=[0,1.1,0; 1.1,0,2.1; 0,1.2,0],
    AIntWal=[5*2.7,0; 5*2.7,6*2.7; 6*2.7,0],
    redeclare package Medium = MediumAir,
    redeclare
      Buildings.HeatTransfer.Data.GlazingSystems.TripleClearAir13ClearAir13Clear
      glaSys,
    nPorts=nPorts,
    lat(displayUnit="deg") = lat)
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
    connect(bui.ports[i, 1], sin[i].ports[1]) annotation (Line(points={{-19.2,-10},
            {-50,-10},{-50,10},{-60,10}},
                     color={0,127,255}));
    connect(bui.ports[i, 2], sou[i].ports[1]) annotation (Line(points={{-19.2,-10},
            {-50,-10},{-50,-70},{-40,-70}},
                                color={0,127,255}));
  end for;
  connect(groTem.port, bui.heaPorFlo)
    annotation (Line(points={{10,-40},{0,-40},{0,-20}}, color={191,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=3.1536e+07, __Dymola_NumberOfIntervals=8760));
end ExampleBuilding_Shape21;
