within BuildingModel;
model SingleFloor
  extends BaseClasses.BaseMultiRoom(
    redeclare SingleRoom sinRoo);
  final parameter Integer nCei=
    sum({if haveRoof[i] then 0 else 1 for i in 1:nRoo})
    "Number of ceiling connectors";

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorCei[nCei]
    "Heat ports to ceiling elements"
    annotation (Placement(transformation(extent={{-10,130},{10,150}}),
                        iconTransformation(extent={{-10,90},{10,110}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorFlo[nRoo, NFlo]
    "Heat ports to floor elements" annotation (Placement(transformation(extent={
            {-10,-150},{10,-130}}), iconTransformation(extent={{-10,-110},{10,-90}})));
equation
  for i in 1:nRoo loop
    // Connect floor elements of each room with global connectors
    for j in 1:nFlo[i] loop
      connect(sinRoo[i].heaPorFlo[j], heaPorFlo[i, j]) annotation (Line(points={{0,-20},{0,-140}},         color={191,0,0}));
    end for;
    // Connect ceiling port with room models
    if not haveRoof[i] then
      connect(sinRoo[i].heaPorCei, heaPorCei[Functions.CountFalse(
        haveRoof, i)])
        annotation (Line(points={{0,20},{0,140}}, color={191,0,0}));
    end if;
  end for;
  annotation (defaultComponentName="mulRoo", Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-92,-2},{18,-92}},
          pattern=LinePattern.None,
          lineColor={117,148,176},
          fillColor={170,213,255},
          fillPattern=FillPattern.Sphere),
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
          extent={{22,-2},{92,-92}},
          pattern=LinePattern.None,
          lineColor={117,148,176},
          fillColor={170,213,255},
          fillPattern=FillPattern.Sphere),
        Rectangle(
          extent={{-92,92},{92,2}},
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
          extent={{-4,47},{4,-47}},
          lineColor={95,95,95},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={-37,-96},
          rotation=90),
        Rectangle(
          extent={{-98,84},{-94,10}},
          lineColor={95,95,95},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{92,-10},{100,-84}},
          lineColor={95,95,95},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{94,-10},{98,-84}},
          lineColor={95,95,95},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-2,47},{2,-47}},
          lineColor={95,95,95},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          origin={-37,-96},
          rotation=90),
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
          rotation=90)}), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SingleFloor;
