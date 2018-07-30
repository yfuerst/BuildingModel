within BuildingModel;
model SingleRoom
  extends Buildings.Fluid.Interfaces.LumpedVolumeDeclarations(
    redeclare replaceable package Medium = Buildings.Media.Air);
  extends BaseClasses.RoomParameters;
  extends BaseClasses.Constructions;

  Buildings.ThermalZones.Detailed.MixedAir roo(
    final nPorts=nPorts,
    final hRoo=hRoo,
    final nConExt=nExtWal,
    final datConExt(
      each final layers=ext,
      final A=if nExtWal == 0 then vector(0) else AExtWal,
      final azi=aziExtWal,
      final til=tilExtWal),
    final nConExtWin=nExtWalWin,
    final nSurBou=nSurBou,
    final surBou(
      final A=ASurBou,
      final til=tilSurBou,
      each final absIR=0.9,
      each final absSol=0.6),
    final nConBou=nIntWal,
    final datConBou(
      each final layers=int,
      final A=if nIntWal == 0 then vector(0) else AIntWal,
      final til=tilIntWal),
    final nConPar=0,
    redeclare final package Medium = Medium,
    final lat=lat,
    final intConMod=intConMod,
    final hIntFixed=hIntFixed,
    final extConMod=extConMod,
    final hExtFixed=hExtFixed,
    final linearizeRadiation=linearizeRadiation,
    final energyDynamics=energyDynamics,
    final massDynamics=massDynamics,
    final p_start=p_start,
    final T_start=T_start,
    final X_start=X_start,
    final C_start=C_start,
    final C_nominal=C_nominal,
    final mSenFac=mSenFac,
    final datConExtWin(
      each final layers=ext,
      each final glaSys=glaSys,
      final A=if nExtWalWin == 0 then vector(0) else AExtWalWin,
      final wWin=if nExtWalWin == 0 then vector(0) else wWin,
      final hWin=if nExtWalWin == 0 then vector(0) else hWin,
      final fFra=fFra,
      final til=tilExtWalWin,
      final azi=aziExtWalWin),
    final m_flow_nominal=m_flow_nominal,
    final homotopyInitialization=homotopyInitialization,
    final steadyStateWindow=steadyStateWindow,
    final AFlo=sum({AFlo[i] for i in 1:nFlo}))
    "Room model"
    annotation (Placement(transformation(extent={{14,-20},{54,20}})));
  Buildings.HeatTransfer.Conduction.MultiLayer conGro[nFlo](
    each final layers=gro,
    each final steadyStateInitial=energyDynamics == Modelica.Fluid.Types.Dynamics.SteadyState,
    each final T_a_start=T_start,
    each final T_b_start=T_start,
    each final stateAtSurface_a=false,
    each final stateAtSurface_b=false,
    final A={AFlo[i] for i in 1:nFlo}) if groundFloor "Construction of ground floor"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={0,-80})));

  Buildings.HeatTransfer.Conduction.MultiLayer conFlo[nFlo](
    each final layers=flo,
    each final steadyStateInitial=energyDynamics == Modelica.Fluid.Types.Dynamics.SteadyState,
    each final T_a_start=T_start,
    each final T_b_start=T_start,
    each final stateAtSurface_a=false,
    each final stateAtSurface_b=false,
    final A={AFlo[i] for i in 1:nFlo}) if intermediateFloor
    "Construction of intermediate floor" annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={30,-80})));

  Buildings.HeatTransfer.Conduction.MultiLayer conRoo(
    final A=ACei,
    final layers=roof,
    final steadyStateInitial=energyDynamics==Modelica.Fluid.Types.Dynamics.SteadyState,
    final stateAtSurface_a=false,
    final stateAtSurface_b=false,
    final T_a_start=T_start,
    final T_b_start=T_start) if haveRoof
    "Construction of roof"
    annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={0,50})));
  Buildings.ThermalZones.Detailed.BaseClasses.ExteriorBoundaryConditions
    bouConRoof(
    final lat=lat,
    final conMod=extConMod,
    final hFixed=hExtFixed,
    final linearizeRadiation=linearizeRadiation,
    final nCon=1,
    final conPar(
      final layers=vector(roof),
      final A=vector(ACei),
      final til=vector(tilCei),
      final azi=vector(aziCei))) if haveRoof
    "Exterior boundary conditions for roof"
    annotation (Placement(transformation(extent={{20,60},{40,80}})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b ports[nPorts](
    redeclare each package Medium = Medium)
    "Fluid inlets and outlets"
    annotation (Placement(transformation(
        extent={{-40,-10},{40,10}},
        origin={-140,-80},
        rotation=90), iconTransformation(
        extent={{-40,-10},{40,10}},
        rotation=90,
        origin={-96,-50})));
  Buildings.BoundaryConditions.WeatherData.Bus weaBus annotation (Placement(
        transformation(extent={{120,60},{160,100}}),
                                                   iconTransformation(extent={{90,40},
            {110,60}})));
  Modelica.Blocks.Sources.Constant qConGai_flow(k=0) if not use_qGai_flow
    "Convective heat gain"
    annotation (Placement(transformation(extent={{-120,30},{-100,50}})));
  Modelica.Blocks.Sources.Constant qRadGai_flow(k=0) if not use_qGai_flow
    "Radiative heat gain"
    annotation (Placement(transformation(extent={{-120,60},{-100,80}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3 if not use_qGai_flow
    annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
  Modelica.Blocks.Sources.Constant qLatGai_flow(k=0) if not use_qGai_flow
    "Latent heat gain"
    annotation (Placement(transformation(extent={{-120,0},{-100,20}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorFlo[nFlo]
    "Heat port to floor element" annotation (Placement(transformation(extent={{-10,
            -150},{10,-130}}), iconTransformation(extent={{-10,-110},{10,-90}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorAir
    "Heat port to air volume" annotation (Placement(transformation(extent={{130,10},
            {150,30}}), iconTransformation(extent={{-50,-10},{-30,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorRad
    "Heat port for radiative heat gain and radiative temperature" annotation (
      Placement(transformation(extent={{130,-30},{150,-10}}),iconTransformation(
          extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorCei if not haveRoof
    "Heat ports to ceiling element"
    annotation (Placement(transformation(extent={{-10,130},{10,150}}),
                        iconTransformation(extent={{-10,90},{10,110}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorInt[nIntWal]
    "Heat port at the outside of internal wall" annotation (Placement(transformation(extent={{-150,
            -10},{-130,10}}),
                        iconTransformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealInput qGai_flow[3] if use_qGai_flow
    "Radiant, convective and latent heat input into room (positive if heat gain)" annotation (Placement(
        transformation(extent={{-160,80},{-140,100}}),  iconTransformation(
          extent={{-120,20},{-100,40}})));
  Modelica.Blocks.Interfaces.RealInput uWin[nExtWalWin](
    each min=0, each max=1, each unit="1") if haveControllableWindow
    "Control signal for window state (used for electrochromic windows, removed otherwise)"
     annotation (Placement(
        transformation(extent={{-10,-10},{10,10}},   rotation=0,
        origin={-150,110}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,60})));
  Modelica.Blocks.Interfaces.RealInput uSha[nExtWalWin](each min=0, each max=1) if
       haveShade
    "Control signal for the shading device (removed if no shade is present)"
    annotation (Placement(transformation(extent={{-160,120},{-140,140}}),
        iconTransformation(extent={{-120,80},{-100,100}})));
equation
  connect(qRadGai_flow.y, multiplex3.u1[1]) annotation (Line(
      points={{-99,70},{-90,70},{-90,47},{-82,47}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(qConGai_flow.y, multiplex3.u2[1]) annotation (Line(
      points={{-99,40},{-82,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(qLatGai_flow.y, multiplex3.u3[1]) annotation (Line(
      points={{-99,10},{-90,10},{-90,33},{-82,33}},
      color={0,0,127},
      smooth=Smooth.None));
  // Connect elements of conGro and conFlo with room model
  for i in 1:nFlo loop
    connect(conGro[i].port_b, roo.surf_surBou[i]) annotation (Line(points={{6.66134e-16,
          -70},{0,-70},{0,-30},{30.2,-30},{30.2,-14}},       color={191,0,0}));
    connect(conFlo[i].port_b, roo.surf_surBou[i]) annotation (Line(points={{30,-70},{
          30,-30},{30.2,-30},{30.2,-14}}, color={191,0,0}));
  end for;
  // Connect heaConRoo/conRoo with room models. Use last connector
  if haveRoof then
    connect(conRoo.port_a, roo.surf_surBou[nSurBou]) annotation (Line(points={{0,40},{
            0,40},{0,-30},{30.2,-30},{30.2,-14}},        color={191,0,0}));
  else
    connect(heaPorCei, roo.surf_surBou[nSurBou]) annotation (Line(points={{0,140},{-10,
            140},{-10,-30},{30.2,-30},{30.2,-14}},color={191,0,0}));
  end if;
  connect(roo.heaPorAir, heaPorAir) annotation (Line(points={{33,0},{140,0},{140,
          20}},                                                                        color={191,0,0}));
  connect(roo.heaPorRad, heaPorRad) annotation (Line(points={{33,-3.8},{140,-3.8},
          {140,-20}}, color={191,0,0}));
  connect(heaPorFlo, conGro.port_a) annotation (Line(points={{0,-140},{0,-90},{-6.66134e-16,
          -90}}, color={191,0,0}));
  connect(heaPorFlo, conFlo.port_a) annotation (Line(points={{0,-140},{0,-140},{
          0,-120},{30,-120},{30,-90}},
                                     color={191,0,0}));
  connect(bouConRoof.weaBus, weaBus) annotation (Line(
      points={{37.4333,70.7},{60,70.7},{60,80},{140,80}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(multiplex3.y, roo.qGai_flow) annotation (Line(points={{-59,40},{-40,40},
          {-40,8},{12.4,8}}, color={0,0,127}));
  connect(roo.weaBus, weaBus) annotation (Line(
      points={{51.9,17.9},{52,17.9},{52,18},{60,18},{60,80},{140,80}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(conRoo.port_b, bouConRoof.opa_a[1]) annotation (Line(points={{0,60},{
          0,60},{0,74},{0,76.6667},{20,76.6667}},
                                                color={191,0,0}));
  for i in 1:nIntWal loop
    connect(heaPorInt[i], roo.surf_conBou[i]) annotation (Line(points={{-140,0},
            {-140,-20},{40,-20},{40,-16}}, color={191,0,0}));
  end for;
  for i in 1:nPorts loop
    connect(ports[i], roo.ports[i]) annotation (Line(
      points={{-140,-80},{-120,-80},{-120,-10},{19,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  end for;
  connect(qGai_flow, roo.qGai_flow) annotation (Line(points={{-150,90},{-96,90},
          {-40,90},{-40,8},{12.4,8}},  color={0,0,127}));
  connect(uWin, roo.uWin) annotation (Line(points={{-150,110},{-34,110},{-34,13},
          {12.4,13}}, color={0,0,127}));
  connect(uSha, roo.uSha) annotation (Line(points={{-150,130},{-90,130},{-28,130},
          {-28,18},{12.4,18}}, color={0,0,127}));
  annotation (defaultComponentName="sinRoo",Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),                                                                graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-100,-10},{-92,-84}},
          lineColor={95,95,95},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-98,-10},{-94,-84}},
          lineColor={95,95,95},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-92,92},{92,-92}},
          pattern=LinePattern.None,
          lineColor={117,148,176},
          fillColor={170,213,255},
          fillPattern=FillPattern.Sphere),
        Rectangle(
          extent={{-100,84},{-92,10}},
          lineColor={95,95,95},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-98,84},{-94,10}},
          lineColor={95,95,95},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-4,83},{4,-83}},
          lineColor={95,95,95},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={1,96},
          rotation=90),
        Rectangle(
          extent={{-2,83},{2,-83}},
          lineColor={95,95,95},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          origin={1,96},
          rotation=90)}),
        Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-140,-140},{
            140,140}})));
end SingleRoom;
