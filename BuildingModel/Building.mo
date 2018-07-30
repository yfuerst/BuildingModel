within BuildingModel;
model Building
  extends BaseClasses.BaseMultiRoom(
    redeclare SingleRoom sinRoo);

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heaPorFlo[nGro]
    "Heat ports to floor elements"
    annotation (Placement(transformation(extent={{-10,-150},{10,-130}}),
                        iconTransformation(extent={{-10,-110},{10,-90}})));
equation
  for i in 1:nRoo loop
    // Connect internal walls with room models
    for j in 1:nRoo loop
      if floCon[i, j] > 0.0 then
        connect(sinRoo[i].heaPorFlo[Functions.SumNumbersMatrixRow(floCon, i, j)], sinRoo[j].heaPorCei) annotation (Line(points={{0,-20},
                {0,-30},{-30,-30},{-30,30},{0,30},{0,20}},color={191,0,0}));
      end if;
    end for;
    // Connect ground port with room models
    if floorType[i] == Types.FloorType.GroundFloor then
      connect(sinRoo[i].heaPorFlo[1], heaPorFlo[Functions.CountTrue(groundFloor, i)]) annotation (Line(points={{0,-20},{0,-60},{0,-140},{0,-140}},
            color={191,0,0}));
    end if;
  end for;
  annotation (defaultComponentName="bui", Icon(coordinateSystem(preserveAspectRatio=false),
        graphics={
    Rectangle(extent={{-90,70},{70,-90}},lineColor={0,0,0},fillColor={230,230,230},
            fillPattern =                                                                        FillPattern.Solid),
    Polygon(points={{-90,70},{-70,90},{90,90},{70,70},{-90,70}},   lineColor={0,0,0},smooth=Smooth.None,fillColor={255,0,0},
            fillPattern =                                                                                                                 FillPattern.Solid),
    Polygon(points={{70,-90},{90,-70},{90,90},{70,70},{70,-90}},   lineColor={0,0,0},smooth=Smooth.None,fillColor={215,215,215},
            fillPattern =                                                                                                                     FillPattern.Solid),
    Rectangle(extent={{40,-48},{60,-88}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},
            fillPattern =                                                                                                 FillPattern.Solid),
    Rectangle(extent={{-50,-48},{30,-88}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},
            fillPattern =                                                                                                  FillPattern.Solid),
    Rectangle(extent={{-80,-48},{-60,-88}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},
            fillPattern =                                                                                                   FillPattern.Solid),
    Rectangle(extent={{-80,2},{-60,-38}}, pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},
            fillPattern =                                                                                                  FillPattern.Solid),
    Rectangle(extent={{-80,52},{-60,12}},fillColor={170,213,255},fillPattern=FillPattern.Solid,pattern=LinePattern.None,lineColor={0,0,0}),
    Rectangle(extent={{-50,52},{-30,12}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},
            fillPattern =                                                                                                 FillPattern.Solid),
    Rectangle(extent={{-50,2},{-30,-38}}, pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},
            fillPattern =                                                                                                  FillPattern.Solid),
    Rectangle(extent={{-20,2},{0,-38}},  pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},
            fillPattern =                                                                                                 FillPattern.Solid),
    Rectangle(extent={{-20,52},{0,12}}, pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},
            fillPattern =                                                                                                FillPattern.Solid),
    Rectangle(extent={{10,52},{30,12}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},
            fillPattern =                                                                                               FillPattern.Solid),
    Rectangle(extent={{10,2},{30,-38}}, pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},
            fillPattern =                                                                                                FillPattern.Solid),
    Rectangle(extent={{40,2},{60,-38}}, pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},
            fillPattern =                                                                                                FillPattern.Solid),
    Rectangle(extent={{40,52},{60,12}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},
            fillPattern =                                                                                               FillPattern.Solid)}),
                                                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Building;
