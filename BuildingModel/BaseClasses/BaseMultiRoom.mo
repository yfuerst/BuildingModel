within BuildingModel.BaseClasses;
partial model BaseMultiRoom
  extends Buildings.Fluid.Interfaces.LumpedVolumeDeclarations(
    redeclare replaceable package Medium = Buildings.Media.Air);
  extends BuildingParameters;
  extends Constructions;

  final parameter Modelica.SIunits.Area AFloEle[nRoo, NFlo]=
    {Functions.ReduceVectorProduct(AFlo[i], floCon[i, :], NFlo) for i in 1:nRoo};

  replaceable SingleRoom sinRoo[nRoo](
    redeclare each final package Medium = Medium,
    each final lat=lat,
    each final ext=ext,
    each final int=intHalf,
    each final gro=gro,
    each final flo=flo,
    each final roof=roof,
    each final NExtWal=NExtWal,
    each final NExtWalWin=NExtWalWin,
    each final NIntWal=NIntWal,
    each final NFlo=NFlo,
    each final intConMod=intConMod,
    each final hIntFixed=hIntFixed,
    each final extConMod=extConMod,
    each final hExtFixed=hExtFixed,
    final haveRoof=haveRoof,
    final floorType=floorType,
    each final linearizeRadiation=linearizeRadiation,
    each final energyDynamics=energyDynamics,
    each final massDynamics=massDynamics,
    each final p_start=p_start,
    each final T_start=T_start,
    each final X_start=X_start,
    each final C_start=C_start,
    each final C_nominal=C_nominal,
    each final mSenFac=mSenFac,
    each final nPorts=nPorts,
    final AFlo=AFloEle,
    final hRoo=hRoo,
    each final use_qGai_flow=use_qGai_flow,
    each final glaSys=glaSys,
    each final steadyStateWindow=steadyStateWindow,
    each final homotopyInitialization=homotopyInitialization,
    final m_flow_nominal=m_flow_nominal,
    final nExtWal=nExtWal,
    final AExtWal=AExtWal,
    final aziExtWal=aziExtWal,
    final nExtWalWin=nExtWalWin,
    final AExtWalWin=AExtWalWin,
    final wWin=wWin,
    final hWin=hWin,
    final fFra=fFra,
    final aziExtWalWin=aziExtWalWin,
    final nIntWal=nIntWal,
    final AIntWal=AIntWal,
    final nFlo=nFlo)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));

  Modelica.Blocks.Interfaces.RealInput qGai_flow[nRoo, 3] if use_qGai_flow
    "Radiant, convective and latent heat input into room (positive if heat gain)"
    annotation (Placement(transformation(extent={{-160,80},{-140,100}}),
        iconTransformation(extent={{-120,20},{-100,40}})));
  Modelica.Blocks.Interfaces.RealInput uSha[nRoo,NExtWalWin](each min=0, each max=1) if haveShade
    "Control signal for the shading device (removed if no shade is present)"
    annotation (Placement(transformation(extent={{-160,120},{-140,140}}),
        iconTransformation(extent={{-120,80},{-100,100}})));
  Modelica.Blocks.Interfaces.RealInput uWin[nRoo,NExtWalWin](each min=0, each max=1, each unit="1") if haveControllableWindow
    "Control signal for window state (used for electrochromic windows, removed otherwise)"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-150,110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,60})));
  Buildings.BoundaryConditions.WeatherData.Bus weaBus annotation (Placement(
        transformation(extent={{120,40},{160,80}}),iconTransformation(extent={{90,40},
            {110,60}})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b ports[nRoo, nPorts](
      redeclare each package Medium = Medium) "Fluid inlets and outlets"
    annotation (Placement(transformation(
        extent={{-40,-10},{40,10}},
        origin={-140,-60},
        rotation=90), iconTransformation(
        extent={{-40,-10},{40,10}},
        rotation=90,
        origin={-96,-50})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorAir[nRoo]
    "Heat port to air volumes"
    annotation (Placement(transformation(extent={{130,10},{150,30}}),
                        iconTransformation(extent={{90,10},{110,30}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorRad[nRoo]
    "Heat port for radiative heat gain and radiative temperature of rooms"
    annotation (Placement(transformation(extent={{130,-30},{150,-10}}),
                        iconTransformation(extent={{90,-30},{110,-10}})));
protected
  final parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic intHalf(
    nLay=int.nLay,
    material(
      x={int.material[i].x/2 for i in 1:int.nLay},
      k=int.material.k,
      c=int.material.c,
      d=int.material.d,
      R={int.material[i].R/2 for i in 1:int.nLay},
      nStaRef=int.material.nStaRef,
      nSta=int.material.nSta,
      steadyState=int.material.steadyState,
      piMat=int.material.piMat,
      piRef=int.material.piRef,
      nStaReal=int.material.nStaReal,
      TSol=int.material.TSol,
      TLiq=int.material.TLiq,
      LHea=int.material.LHea,
      ensureMonotonicity=int.material.ensureMonotonicity,
      phasechange=int.material.phasechange),
    absIR_a=int.absIR_a,
    absIR_b=int.absIR_b,
    absSol_a=int.absSol_a,
    absSol_b=int.absSol_b,
    roughness_a=int.roughness_a) annotation(HideResult=true);
equation
  for i in 1:nRoo loop
    connect(sinRoo[i].weaBus, weaBus) annotation (Line(
      points={{20,10},{60,10},{60,60},{140,60}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
    if nPorts > 0 then
      connect(sinRoo[i].ports[1:nPorts], ports[i, 1:nPorts]) annotation (Line(points={{-19.2,
            -10},{-20,-10},{-120,-10},{-120,-60},{-140,-60}},
                           color={0,127,255}));
    end if;
    for j in 1:nRoo loop
      if rooCon[i, j] > 0.0 then
        connect(sinRoo[i].heaPorInt[integer(floor(rooCon[i, j] + 0.01))], sinRoo[j].heaPorInt[integer(floor(rem(rooCon[i, j], 1)*10 + 0.01))]);
      end if;
    end for;
  end for;
  connect(qGai_flow, sinRoo.qGai_flow) annotation (Line(points={{-150,90},{-80,
          90},{-80,6},{-22,6}},
                            color={0,0,127}));
  connect(uWin, sinRoo.uWin) annotation (Line(points={{-150,110},{-150,110},{
          -74,110},{-74,12},{-22,12}},
                                   color={0,0,127}));
  connect(uSha, sinRoo.uSha) annotation (Line(points={{-150,130},{-68,130},{-68,
          18},{-22,18}}, color={0,0,127}));
  connect(sinRoo.heaPorAir,heaPorAir) annotation (Line(points={{-8,0},{-8,0},{-8,
          6},{140,6},{140,20}}, color={191,0,0}));
  connect(sinRoo.heaPorRad,heaPorRad) annotation (Line(points={{0,0},{0,-6},{140,
          -6},{140,-18},{140,-20}},
                              color={191,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),
        Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-140,-140},{
            140,140}})));
end BaseMultiRoom;
