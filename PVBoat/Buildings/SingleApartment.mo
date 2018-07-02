within SPACS_Matrix.Buildings;
model SingleApartment
  "1 zone thermal building model with the shape of a box"
  extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
    final prescribedAirchange = false,
    final calcIdealLoads = false,
    final useAirPathes = false,
    final nAirpathes = 0,
    final heatSources = false,
    final surfacesToSolids(nSurfaces=0),
    final show_TAir = true,
    final nZones = 1,
    final moistureSources = false,
    final surfacesToAmbient(nSurfaces=7));
//    final nHeatSources = 0,

  package Medium2 = BuildingSystems.Media.Air
    "Medium model air";

  BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zoneApartment(
    prescribedAirchange=false,
    nAirpathes=2,
    heightAirpath={
     0.5,1.5},
    height=4.42,
    V=15.96*4.42,
    calcIdealLoads=false,
    heatSources=false,
    nConstructions=7)
    annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
//    nHeatSources=0,

  BuildingSystems.Buildings.Constructions.Windows.Window window1(
    angleDegTil=90.0,
    angleDegAzi=0.0+angleDegAziBuilding,
    width=0.9,
    height=1.6,
    redeclare SPACS_Matrix.Buildings.Data.Constructions.Transparent.SingleGlazingEgypt constructionData)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=-90,origin={30,-60})));

  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes ApartmentWallWest(
    redeclare SPACS_Matrix.Buildings.Data.Constructions.Opaque.OuterWallMultistoreyEgypt constructionData,
    angleDegTil=90.0,
    angleDegAzi=90.0+angleDegAziBuilding,
    width=5,
    height=3.5)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-60,0})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes ApartmentWallNorth(
    redeclare SPACS_Matrix.Buildings.Data.Constructions.Opaque.OuterWallMultistoreyEgypt constructionData,
    angleDegTil=90.0,
    angleDegAzi=90.0+angleDegAziBuilding,
    width=3,
    height=3.5)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={0,60})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes ApartmentWallEast(
    redeclare SPACS_Matrix.Buildings.Data.Constructions.Opaque.OuterWallMultistoreyEgypt constructionData,
    angleDegTil=90.0,
    angleDegAzi=-90.0+angleDegAziBuilding,
    width=5,
    height=3.5)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0,origin={60,0})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes ApartmentWallSouth(
    redeclare SPACS_Matrix.Buildings.Data.Constructions.Opaque.OuterWallMultistoreyEgypt constructionData,
    angleDegTil=90.0,
    angleDegAzi=90.0+angleDegAziBuilding,
    width=3,
    height=3.5)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,-60})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes roofApartment(
    redeclare SPACS_Matrix.Buildings.Data.Constructions.Opaque.RoofMultistoreyEgypt constructionData,
    angleDegTil=180.0,
    angleDegAzi=0.0,
    width=15.96,
    height=1.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-20,40})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes floorApartment(
    redeclare SPACS_Matrix.Buildings.Data.Constructions.Opaque.IntermediateCeilingEgypt constructionData,
    angleDegTil=0.0,
    angleDegAzi=0.0,
    width=15.96,
    height=1.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-20,-40})));

  Modelica.Fluid.Interfaces.FluidPort_a port_SUP_app(
    redeclare package Medium = Medium2)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=180,origin={24,10}),
      iconTransformation(extent={{120,40},{140,60}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_EHA_app(
    redeclare package Medium = Medium2)
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=180,origin={24,24}),
      iconTransformation(extent={{120,80},{140,100}})));

  parameter Boolean InteriorWalls = false
    "True: Interior walls are present, false: Interior walls are  absent"
    annotation(Dialog(tab = "Opaque constructions", group = "Interior constructions"));
  parameter Modelica.SIunits.Area AInteriorWalls = 1.0
    "Surface area of one side of the interior walls"
    annotation(Dialog(tab="Opaque constructions",group="Interior constructions"));
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionWallsInterior
    "Data of the thermal construction"
    annotation(Dialog(tab = "Opaque constructions", group = "Interior constructions"), choicesAllMatching=true);
  parameter Boolean InteriorCeilings = false
    "True: Interior ceilings are present, false: Interior ceilings are absent"
    annotation(Dialog(tab = "Opaque constructions", group = "Interior constructions"));
  parameter Modelica.SIunits.Area AInteriorCeilings = 1.0
    "Surface area of one side of the interior ceilings"
    annotation(Dialog(tab="Opaque constructions",group="Interior constructions"));
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionCeilingsInterior
    "Data of the thermal construction"
    annotation(Dialog(tab = "Opaque constructions", group = "Interior constructions"), choicesAllMatching=true);

equation
  connect( zoneApartment.TAir, TAir[1]);

  connect(ApartmentWallWest.toSurfacePort_1, zoneApartment.toConstructionPorts[1])
    annotation (Line(points={{-58,0},{0,0},{0,0.285714}}, color={0,0,0}));
  connect(ApartmentWallNorth.toSurfacePort_1, zoneApartment.toConstructionPorts[
    2]) annotation (Line(points={{0,58},{0,0.857143}}, color={0,0,0}));
  connect(ApartmentWallSouth.toSurfacePort_1, zoneApartment.toConstructionPorts[
    3]) annotation (Line(points={{0,-58},{0,1.42857}}, color={0,0,0}));
  connect(window1.toSurfacePort_1, zoneApartment.toConstructionPorts[4])
    annotation (Line(points={{30,-58},{30,-20},{0,-20},{0,2}}, color={0,0,0}));
  connect(floorApartment.toSurfacePort_1, zoneApartment.toConstructionPorts[5])
    annotation (Line(points={{-20,-38},{-20,-20},{0,-20},{0,2.57143}}, color={0,
          0,0}));
  connect(roofApartment.toSurfacePort_1, zoneApartment.toConstructionPorts[6])
    annotation (Line(points={{-20,38},{-20,20},{0,20},{0,3.14286}}, color={0,0,0}));
  connect(ApartmentWallEast.toSurfacePort_1, zoneApartment.toConstructionPorts[7])
    annotation (Line(points={{58,0},{0,0},{0,3.71429}}, color={0,0,0}));
  connect(port_SUP_app, zoneApartment.airpathPorts[1]) annotation (Line(points={
          {24,10},{18,10},{18,16},{-4,16},{-4,13}}, color={0,127,255}));
  connect(port_EHA_app, zoneApartment.airpathPorts[2]) annotation (Line(points={
          {24,24},{18,24},{18,16},{-8,16},{-8,13}}, color={0,127,255}));
  connect(surfacesToAmbient.toConstructionPorts[1], ApartmentWallWest.toSurfacePort_2)
    annotation (Line(points={{-170.8,0},{-62,0}}, color={127,0,0}));
  connect(surfacesToAmbient.toConstructionPorts[2], roofApartment.toSurfacePort_2)
    annotation (Line(points={{-170.8,0},{-80,0},{-80,80},{-20,80},{-20,42}},
        color={127,0,0}));
  connect(surfacesToAmbient.toConstructionPorts[3], ApartmentWallNorth.toSurfacePort_2)
    annotation (Line(points={{-170.8,2.66454e-15},{-126,2.66454e-15},{-126,0},{-80,
          0},{-80,80},{0,80},{0,62}}, color={127,0,0}));
  connect(surfacesToAmbient.toConstructionPorts[4], ApartmentWallEast.toSurfacePort_2)
    annotation (Line(points={{-170.8,0},{-80,0},{-80,80},{80,80},{80,0},{62,0}},
        color={127,0,0}));
  connect(surfacesToAmbient.toConstructionPorts[5], ApartmentWallSouth.toSurfacePort_2)
    annotation (Line(points={{-170.8,0},{-80,0},{-80,-80},{0,-80},{0,-62}},
        color={127,0,0}));
  connect(surfacesToAmbient.toConstructionPorts[6], window1.toSurfacePort_2)
    annotation (Line(points={{-170.8,0},{-80,0},{-80,-80},{30,-80},{30,-62}},
        color={127,0,0}));
  connect(surfacesToAmbient.toConstructionPorts[7], floorApartment.toSurfacePort_2)
    annotation (Line(points={{-170.8,0},{-80,0},{-80,-80},{-20,-80},{-20,-42}},
        color={127,0,0}));
  annotation(defaultComponentName="building",
Documentation(info="<html>
<p>
This is a 1 zone thermal building model with the shape of a box.
</p>
</html>", revisions="<html>
<ul>
<li>
January 25, 2018 by Christoph Nytsch-Geusen:<br/>
Adaptation to new zone model.
</li>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end SingleApartment;
