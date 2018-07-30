within BuildingModel.BaseClasses;
record RoomParameters
  "Parameters for rooms"
  parameter Modelica.SIunits.Angle lat "Latitude";

  // Floor + ceiling
  parameter Integer nFlo=1 "Number of floor elements";
  parameter Modelica.SIunits.Area AFlo[NFlo]
    "Floor area";
  final parameter Modelica.SIunits.Area ACei=sum({AFlo[i] for i in 1:nFlo})
    "Area of ceiling" annotation (HideResult=true);
  parameter Modelica.SIunits.Length hRoo
    "Room height";
  parameter Boolean haveRoof=true
    "Set to true to declare a room on the top floor";
  parameter Types.FloorType floorType=Types.FloorType.GroundFloor
    "Choice to define to floor type";
  parameter Boolean linearizeRadiation=true
    "Set to true to linearize emissive power";
  parameter Boolean steadyStateWindow = false
    "Set to false to add thermal capacity at window, which generally leads to faster simulation"
    annotation (Dialog(tab="Dynamics", group="Glazing system"));
  final parameter Modelica.SIunits.Angle tilFlo=Buildings.Types.Tilt.Floor
    "Surface tilt of floors"
    annotation (HideResult=true);
  final parameter Modelica.SIunits.Angle aziCei=Buildings.Types.Azimuth.S
    "Azimut of ceilings"
    annotation (HideResult=true);
  final parameter Modelica.SIunits.Angle tilCei=Buildings.Types.Tilt.Ceiling
    "Surface tilt of ceilings"
    annotation (HideResult=true);

  // Convection
  parameter Buildings.HeatTransfer.Types.InteriorConvection intConMod=
    Buildings.HeatTransfer.Types.InteriorConvection.Fixed
    "Convective heat transfer model for room-facing surfaces of opaque constructions"
    annotation (Dialog(group="Convective heat transfer"));
  parameter Modelica.SIunits.CoefficientOfHeatTransfer hIntFixed=3.0
    "Constant convection coefficient for room-facing surfaces of opaque constructions"
    annotation (Dialog(group="Convective heat transfer", enable=(conMod ==
          Buildings.HeatTransfer.Types.InteriorConvection.Fixed)));
  parameter Buildings.HeatTransfer.Types.ExteriorConvection extConMod=
    Buildings.HeatTransfer.Types.ExteriorConvection.Fixed
    "Convective heat transfer model for exterior facing surfaces of opaque constructions"
    annotation (Dialog(group="Convective heat transfer"));
  parameter Modelica.SIunits.CoefficientOfHeatTransfer hExtFixed=10.0
    "Constant convection coefficient for exterior facing surfaces of opaque constructions"
    annotation (Dialog(group="Convective heat transfer", enable=(conMod ==
          Buildings.HeatTransfer.Types.ExteriorConvection.Fixed)));
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal(min=0) = sum({AFlo[i] for i in 1:nFlo})*hRoo*1.2/3600
    "Nominal mass flow rate" annotation (Dialog(group="Nominal condition"));
  parameter Boolean homotopyInitialization = true "= true, use homotopy method"
    annotation(Evaluate=true, Dialog(tab="Advanced"));

  // Internal loads
  parameter Boolean use_qGai_flow=false
    "Set to true to consider internal heat loads";

  // Exterior constructions without window
  parameter Integer nExtWal(min=0, start=0)=0
    "Number of exterior walls without window"
    annotation (Dialog(tab="Exterior constructions", group="Without window"));
  parameter Modelica.SIunits.Area AExtWal[NExtWal](each start=0)=
    fill(0, NExtWal)
    "Area of exterior walls without window (1D-Array)"
    annotation (Dialog(tab="Exterior constructions", group="Without window"));
  parameter Modelica.SIunits.Angle aziExtWal[NExtWal](each start=0)=
    fill(0, NExtWal)
    "Azimuth of exterior walls without window (1D-Array)"
    annotation (Dialog(tab="Exterior constructions", group="Without window"));
  final parameter Modelica.SIunits.Angle tilExtWal[NExtWal]=
    fill(Buildings.Types.Tilt.Wall, NExtWal)
    "Surface tilt of exterior walls without window"
    annotation (HideResult=true);

  // Exterior constructions with window
  parameter Integer nExtWalWin(min=0, start=0)=0
    "Number of external walls with window"
    annotation (Dialog(tab="Exterior constructions", group="With window"));
  parameter Modelica.SIunits.Area AExtWalWin[NExtWalWin]=
    fill(0, NExtWalWin)
    "Area of external walls with window (1D-Array)"
    annotation (Dialog(tab="Exterior constructions", group="With window"));
  parameter Modelica.SIunits.Length hWin[NExtWalWin]=
    fill(0, NExtWalWin)
    "Window height, glass only (1D-Array)"
    annotation (Dialog(tab="Exterior constructions", group="With window"));
  parameter Modelica.SIunits.Length wWin[NExtWalWin]=
    fill(0, NExtWalWin)
    "Window width, glass only (1D-Array)"
    annotation (Dialog(tab="Exterior constructions", group="With window"));
  parameter Real fFra[NExtWalWin](
    each final min=0,
    each final max=1) = fill(0.1, NExtWalWin)
    "Fraction of window frame divided by total window area (1D-Array)"
    annotation (Dialog(tab="Exterior constructions", group="With window"));
  parameter Modelica.SIunits.Angle aziExtWalWin[NExtWalWin]=
    fill(0, NExtWalWin)
    "Azimut of external walls with window (1D-Array)"
    annotation (Dialog(tab="Exterior constructions", group="With window"));
  final parameter Modelica.SIunits.Angle tilExtWalWin[NExtWalWin]=
    fill(Buildings.Types.Tilt.Wall, NExtWalWin)
    "Surface tilt of external walls with window"
    annotation (HideResult=true);

  // Interior constructions
  parameter Integer nIntWal=0 "Number of internal walls of each room"
    annotation (Dialog(tab="Interior constructions"));
  parameter Modelica.SIunits.Area AIntWal[NIntWal]=fill(0, NIntWal)
    "Area of interior walls (1D-Array)"
    annotation (Dialog(tab="Interior constructions"));

  // Roof and floor
  final parameter Integer nSurBou=nFlo + 1
    "Number of surface heat transfer models (floor elements plus ceiling)"
    annotation (HideResult=true);
  final parameter Modelica.SIunits.Angle tilIntWal[NIntWal]=
    fill(Buildings.Types.Tilt.Wall, NIntWal)
    "Surface tilt of interior walls"
    annotation (HideResult=true);
  final parameter Modelica.SIunits.Area ASurBou[:]=
    cat(1, {AFlo[i] for i in 1:nFlo}, vector(ACei))
    "Area of surface heat transfer models"
    annotation (HideResult=true);
  final parameter Modelica.SIunits.Angle tilSurBou[:]=
    cat(1, fill(tilFlo, nFlo), vector(tilCei))
    "Surface tilt of surface heat transfer models"
    annotation (HideResult=true);

  // Number of fluid ports for air exchange
  parameter Integer nPorts=0 "Number of ports" annotation (Evaluate=true,
      Dialog(
      connectorSizing=true,
      tab="General",
      group="Ports"));

  // Internal parameters
  parameter Integer NExtWal(min=1)=max(1, nExtWal)
    "Number of elements for exterior walls (used in floor and building model)"
    annotation(Dialog(tab="Internal Interface",enable=false),HideResult=true);
  parameter Integer NExtWalWin(min=1)=max(1, nExtWalWin)
    "Number of elements for exterior walls with windows (used in floor and building model)"
    annotation(Dialog(tab="Internal Interface",enable=false),HideResult=true);
  parameter Integer NIntWal=max(1, nIntWal)
    "Number of elements for interior walls (used in floor and building model)"
    annotation(Dialog(tab="Internal Interface",enable=false),HideResult=true);
  parameter Integer NFlo=max(1, nFlo)
    "Maximum number of floor elements (used in floor and building model)"
    annotation(Dialog(tab="Internal Interface",enable=false),HideResult=true);
protected
  final parameter Boolean groundFloor=floorType==Types.FloorType.GroundFloor;
  final parameter Boolean intermediateFloor=floorType==Types.FloorType.IntermediateFloor;
end RoomParameters;
