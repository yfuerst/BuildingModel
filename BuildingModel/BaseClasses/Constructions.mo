within BuildingModel.BaseClasses;
record Constructions
  "Constructions for buildings with multiple rooms or single rooms"

  replaceable parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic gro
    "Construction material for the ground floor"
    annotation (choicesAllMatching=true,
    Dialog(tab="Material"),
    HideResult=true,
    Placement(transformation(extent={{-60,-90},{-40,-70}})));
  replaceable parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic flo
    "Construction material for the intermediate floor"
    annotation (choicesAllMatching=true,
    Dialog(tab="Material"),
    HideResult=true,
    Placement(transformation(extent={{-100,-60},{-80,-40}})));
  replaceable parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic ext
    "Construction material for the exterior wall"
    annotation (choicesAllMatching=true,Dialog(tab="Material"), HideResult=true,
      Placement(transformation(extent={{-100,-120},{-80,-100}})));
  replaceable parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic int
    "Construction material for the interior wall"
    annotation (choicesAllMatching=true,Dialog(tab="Material"), HideResult=true,
      Placement(transformation(extent={{-60,-120},{-40,-100}})));
  replaceable parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic roof
    "Construction material for the roof"
    annotation (choicesAllMatching=true,
    Dialog(tab="Material"),
    HideResult=true,
    Placement(transformation(extent={{-100,-90},{-80,-70}})));
  replaceable parameter Buildings.HeatTransfer.Data.GlazingSystems.Generic glaSys
    "Data record for the glazing system" annotation (
    choicesAllMatching=true,
    Dialog(tab="Material"),
    HideResult=true,
    Placement(transformation(extent={{100,100},{120,120}})));

  // Window parameters
  final parameter Boolean haveControllableWindow=glaSys.haveControllableWindow
    "Flag, true if the windows allow multiple states, such as for electrochromic windows"
    annotation(Evaluate=true);
  final parameter Boolean haveExteriorShade=glaSys.haveExteriorShade
    "Set to true if window has exterior shade (at surface a)"
    annotation (Dialog(group="Shading"));
  final parameter Boolean haveInteriorShade=glaSys.haveInteriorShade
    "Set to true if window has interior shade (at surface b)"
    annotation (Dialog(group="Shading"));
  final parameter Boolean haveShade=haveExteriorShade or haveInteriorShade
    "Set to true if the windows have a shade";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),
        Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-140,-140},{
            140,140}})));
end Constructions;
