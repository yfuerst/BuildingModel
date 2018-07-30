within BuildingModel.BaseClasses;
record BuildingParameters
  "Parameters for buildings with multiple rooms"

  parameter Integer nPorts=0 "Number of fluid ports for air exchange" annotation (Evaluate=true, Dialog(tab="General"));
  parameter Modelica.SIunits.Angle lat "Latitude";
  parameter Integer nRoo(min=1)=4 "Number of rooms";

  // Floor + ceiling
  final parameter Integer nFlo[nRoo]={max(1, Functions.SumNumbersMatrixRow(
      floCon,
      i,
      nRoo)) for i in 1:nRoo}
    "Number of floor elements above lower rooms (can be calucated from floCon; 1D-Array)"
    annotation (Dialog(tab="Interior constructions"));
  parameter Modelica.SIunits.Area AFlo[nRoo]
    "Floor areas of each room (2D-Array)";
  parameter Modelica.SIunits.Length hRoo[nRoo]
    "Room height of each room (1D-Array)";
  parameter Boolean haveRoof[nRoo]=fill(true, nRoo)
    "Set to true to declare a top floor (1D-Array)";
  parameter Types.FloorType floorType[nRoo]=
    fill(Types.FloorType.GroundFloor, nRoo)
    "Choice to define to floor type (1D-Array)";
  parameter Boolean linearizeRadiation=true
    "Set to true to linearize emissive power";
  parameter Boolean steadyStateWindow = false
    "Set to false to add thermal capacity at window, which generally leads to faster simulation"
    annotation (Dialog(tab="Dynamics", group="Glazing system"));
  final parameter Integer nGro=
    sum({if floorType[i]==Types.FloorType.GroundFloor then 1 else 0 for i in 1:nRoo})
    "Number of ground connectors";

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
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal[nRoo](each min=0)=
    {AFlo[i]*hRoo[i]*1.2/3600 for i in 1:nRoo}
    "Nominal mass flow rate" annotation (Dialog(group="Nominal condition"));
  parameter Boolean homotopyInitialization = true "= true, use homotopy method"
    annotation(Evaluate=true, Dialog(tab="Advanced"));

  // Internal loads
  parameter Boolean use_qGai_flow=false
    "Set to true to consider internal heat loads";

  // Exterior constructions without window
  parameter Integer[nRoo] nExtWal(each min=0, each start=0)=fill(0, nRoo)
    "Number of exterior walls without window (1D-Array)"
    annotation (Dialog(tab="Exterior constructions", group="Without window"));
  final parameter Integer NExtWal(min=1)=max(1, max(nExtWal))
    "Number of elements for exterior walls"
    annotation (HideResult=true);
  parameter Modelica.SIunits.Area AExtWal[nRoo, NExtWal](each start=0)=
    fill(0, nRoo, NExtWal)
    "Area of exterior walls without window (2D-Array)"
    annotation (Dialog(tab="Exterior constructions", group="Without window"));
  parameter Modelica.SIunits.Angle aziExtWal[nRoo, NExtWal](each start=0)=
    fill(0, nRoo, NExtWal)
    "Azimuth of exterior walls without window (2D-Array)"
    annotation (Dialog(tab="Exterior constructions", group="Without window"));

  // Exterior constructions with window
  parameter Integer[nRoo] nExtWalWin(each min=0, each start=0)=
    fill(0, nRoo)
    "Number of external walls with window (1D-Array)"
    annotation (Dialog(tab="Exterior constructions", group="With window"));
  final parameter Integer NExtWalWin=max(1, max(nExtWalWin))
    "Number of elements for exterior walls with windows"
    annotation (HideResult=true);
  parameter Modelica.SIunits.Area AExtWalWin[nRoo, NExtWalWin]=
    fill(0, nRoo, NExtWalWin)
    "Area of external walls with window (2D-Array)"
    annotation (Dialog(tab="Exterior constructions", group="With window"));
  parameter Modelica.SIunits.Length hWin[nRoo, NExtWalWin]=
    fill(0, nRoo, NExtWalWin)
    "Window height, glass only (2D-Array)"
    annotation (Dialog(tab="Exterior constructions", group="With window"));
  parameter Modelica.SIunits.Length wWin[nRoo, NExtWalWin]=
    fill(0, nRoo, NExtWalWin)
    "Window width, glass only (2D-Array)"
    annotation (Dialog(tab="Exterior constructions", group="With window"));
  parameter Real fFra[nRoo, NExtWalWin](
    each final min=0,
    each final max=1) = fill(0.1, nRoo, NExtWalWin)
    "Fraction of window frame divided by total window area (2D-Array)"
    annotation (Dialog(tab="Exterior constructions", group="With window"));
  parameter Modelica.SIunits.Angle aziExtWalWin[nRoo, NExtWalWin]=
    fill(0, nRoo, NExtWalWin)
    "Azimut of external walls with window (2D-Array)"
    annotation (Dialog(tab="Exterior constructions", group="With window"));

  // Interior constructions
  final parameter Integer nIntWal[nRoo]={Functions.SumNumbersMatrixRow(
      rooCon,
      i,
      nRoo) for i in 1:nRoo}
    "Number of internal walls of each room (can be calucated from rooCon; 1D-Array)"
    annotation (Dialog(tab="Interior constructions"));
  parameter Real rooCon[nRoo, nRoo]
    "Adjacency matrix to define the room connections"
    annotation (Dialog(tab="Interior constructions"));
  parameter Modelica.SIunits.Area AIntWal[nRoo, NIntWal]
    "Area of interior walls (2D-Array)"
    annotation (Dialog(tab="Interior constructions"));
  final parameter Integer NIntWal=max(1, max(nIntWal))
    "Number of elements for interior walls"
    annotation (HideResult=true);

  // Floor constructions
  parameter Real floCon[nRoo, nRoo]=zeros(nRoo, nRoo)
    "Adjacency matrix to define the floor connections"
    annotation (Dialog(tab="Interior constructions"));
  final parameter Integer NFlo=max(1, max(nFlo))
    "Number of floor elements"
    annotation (HideResult=true);
protected
  final parameter Boolean groundFloor[nRoo]={floorType[i]==Types.FloorType.GroundFloor for i in 1:nRoo};
  final parameter Boolean intermediateFloor[nRoo]={floorType[i]==Types.FloorType.IntermediateFloor for i in 1:nRoo};
end BuildingParameters;
