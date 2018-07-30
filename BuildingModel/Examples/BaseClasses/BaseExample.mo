within BuildingModel.Examples.BaseClasses;
partial model BaseExample
  extends Modelica.Icons.Example;

  replaceable package MediumAir=Buildings.Media.Air "Air medium model";
  parameter Modelica.SIunits.Angle lat=0.73303828583762 "Latitude";
  parameter Boolean haveRoof[nRoo]=fill(true, nRoo)
    "Set to true to declare a top floor (1D-Array)";
  parameter Types.FloorType floorType[nRoo]=
    fill(Types.FloorType.GroundFloor, nRoo)
    "Choice to define to floor type (1D-Array)";
  parameter Integer nPorts=2 "Number of fluid ports";
  parameter Integer nRoo "Number of rooms";
  parameter Integer nGro=nRoo "Number of rooms on ground floor";
  parameter Modelica.SIunits.Area A[nRoo] "Ground area of rooms";
  parameter Modelica.SIunits.Height h[nRoo] "Height of rooms";
  final parameter Modelica.SIunits.Volume V[nRoo]={A[i]*h[i] for i in 1:nRoo} "Room volumes";
  parameter Real airExRa[nRoo](each unit="1/h") "Air exchange rates";
  final parameter Modelica.SIunits.MassFlowRate mEx_flow[nRoo]=
    {V[i]*airExRa[i]/3600*MediumAir.density(
      state=MediumAir.setState_phX(
        p=MediumAir.p_default,
        h=MediumAir.h_default,
        X=MediumAir.X_default)) for i in 1:nRoo};

  Buildings.Fluid.Sources.FixedBoundary sin[nRoo](
    redeclare each final package Medium = MediumAir,
    each final nPorts=1)
    annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  Buildings.Fluid.Sources.MassFlowSource_T sou[nRoo](
    each final use_T_in=true,
    each final use_X_in=true,
    redeclare each final package Medium = MediumAir,
    final m_flow=mEx_flow,
    each final nPorts=1) annotation (Placement(transformation(extent={{-20,-80},
            {-40,-60}})));
  Buildings.Utilities.Psychrometrics.X_pTphi x_pTphi
    annotation (Placement(transformation(extent={{20,-64},{0,-84}})));
  Buildings.BoundaryConditions.WeatherData.Bus weaBus annotation (Placement(
        transformation(extent={{30,20},{50,40}}), iconTransformation(extent={{90,
            50},{110,70}})));
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=
        Buildings.BoundaryConditions.WeatherData.BaseClasses.getAbsolutePath("modelica:/BuildingModel/Resources/weatherdata/DEU_Berlin.103840_IWEC.mos"))
    "File reader that reads weather data"
    annotation (Placement(transformation(extent={{80,20},{60,40}})));
  Buildings.HeatTransfer.Sources.FixedTemperature groTem[nGro](each T=283.15)
    annotation (Placement(transformation(extent={{30,-50},{10,-30}})));
equation
  connect(weaBus.relHum,x_pTphi. phi) annotation (Line(
      points={{40,30},{40,30},{40,-20},{40,-68},{22,-68}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(weaBus.TDryBul,x_pTphi. T) annotation (Line(
      points={{40,30},{40,30},{40,-74},{22,-74}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(weaBus.pAtm,x_pTphi. p_in) annotation (Line(
      points={{40,30},{40,30},{40,-80},{22,-80}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  for i in 1:nRoo loop
    connect(weaBus.TDryBul,sou [i].T_in) annotation (Line(
      points={{40,30},{40,-60},{-10,-60},{-10,-66},{-18,-66}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
    connect(x_pTphi.X,sou [i].X_in) annotation (Line(points={{-1,-74},{-1,-74},{
          -18,-74}},                                                                    color={0,0,127}));
  end for;
  connect(weaDat.weaBus,weaBus)  annotation (Line(
      points={{60,30},{50,30},{40,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end BaseExample;
