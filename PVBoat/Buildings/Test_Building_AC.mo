within SPACS_Matrix.Buildings;
model Test_Building_AC
  extends Modelica.Icons.Example;

  package Medium2 = BuildingSystems.Media.Air
    "Medium model air";

  SingleApartment building
    annotation (Placement(transformation(extent={{40,20},{60,40}})));
  BuildingSystems.Buildings.Ambient ambient(nSurfaces=building.nSurfacesAmbient)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T boundary(
    nPorts=1,
    m_flow=1,
    redeclare package Medium = Medium2,
    use_T_in=false,
    T=273.15 + 20)
    annotation (Placement(transformation(extent={{52,-20},{72,0}})));
  BuildingSystems.Fluid.Sources.FixedBoundary bou(
    nPorts=1,
    T=273.15 + 20,
    redeclare package Medium = Medium2,
    p=99999) annotation (Placement(transformation(extent={{50,62},{70,82}})));
equation
  connect(ambient.toAirPorts, building.toAmbientAirPorts) annotation (Line(
        points={{-62,66},{-58,66},{-58,42},{36,42},{36,26},{41,26}}, color={85,
          170,255}));
  connect(ambient.toSurfacePorts, building.toAmbientSurfacesPorts) annotation (
      Line(points={{-62,74},{-56,74},{-56,44},{38,44},{38,34},{41,34}}, color={
          0,255,0}));
  connect(boundary.ports[1], building.port_SUP_app) annotation (Line(points={{72,-10},
          {80,-10},{80,35},{63,35}},                      color={0,127,255}));
  connect(bou.ports[1], building.port_EHA_app) annotation (Line(points={{70,72},
          {80,72},{80,39},{63,39}}, color={0,127,255}));
end Test_Building_AC;
