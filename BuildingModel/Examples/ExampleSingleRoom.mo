within BuildingModel.Examples;
model ExampleSingleRoom
  extends Examples.BaseClasses.BaseExample(
    final nRoo=1,
    final A={20},
    final h={2.7},
    final airExRa=ones(nRoo));

  SingleRoom sinRoo(
    hRoo=scalar(h),
    nPorts=2,
    nExtWal=1,
    AExtWal={12},
    aziExtWal={Buildings.Types.Azimuth.N},
    nExtWalWin=1,
    AExtWalWin={15},
    hWin={2},
    wWin={4},
    aziExtWalWin={Buildings.Types.Azimuth.W},
    nIntWal=2,
    AIntWal={12,15},
    redeclare Data.OpaqueConstructions.Flo1958 flo,
    redeclare Data.OpaqueConstructions.Ext1958 ext,
    redeclare Data.OpaqueConstructions.Int1958 int,
    redeclare Data.OpaqueConstructions.Roof1958 roof,
    redeclare package Medium = MediumAir,
    redeclare Data.OpaqueConstructions.Gro1984 gro,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    redeclare Buildings.HeatTransfer.Data.GlazingSystems.DoubleClearAir13Clear
      glaSys,
    AFlo=A,
    nFlo=size(A, 1),
    lat=lat)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));

equation
  connect(sinRoo.weaBus, weaBus) annotation (Line(
      points={{20,10},{30,10},{30,30},{40,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(sin[1].ports[1], sinRoo.ports[2]) annotation (Line(points={{-60,10},{
          -50,10},{-50,-6},{-19.2,-6}},
                                    color={0,127,255}));
  connect(sou[1].ports[1], sinRoo.ports[1]) annotation (Line(points={{-40,-70},{
          -50,-70},{-50,-14},{-19.2,-14}},
                                       color={0,127,255}));
  connect(groTem.port, sinRoo.heaPorFlo)
    annotation (Line(points={{10,-40},{0,-40},{0,-20}}, color={191,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=3.1536e+07));
end ExampleSingleRoom;
