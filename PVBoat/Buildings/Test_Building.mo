within SPACS_Matrix.Buildings;
model Test_Building
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant ACH(k=0.23)
    annotation (Placement(transformation(extent={{118,18},{110,26}})));
  Modelica.Blocks.Sources.Constant TSetHeating(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{-3,-3},{3,3}},rotation=180,origin={115,51})));
  Modelica.Blocks.Sources.Constant TSetCooling(k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{-3,-3},{3,3}},rotation=180,origin={115,37})));
  SingleApartment building(
    height=4,
    redeclare
      BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallSingle2014
      constructionWall1,
    redeclare
      BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallSingle2014
      constructionWall2,
    redeclare
      BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallSingle2014
      constructionWall3,
    redeclare
      BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallSingle2014
      constructionWall4,
    redeclare
      BuildingSystems.Buildings.Data.Constructions.Thermal.RoofSingle2014
      constructionCeiling,
    redeclare
      BuildingSystems.Buildings.Data.Constructions.Thermal.BasePlateSingle2014
      constructionBottom,
    InteriorWalls=false,
    InteriorCeilings=false,
    width=6,
    length=4,
    widthWindow1=0.9,
    heightWindow1=1.4,
    framePortionWindow1=0.6,
    redeclare Data.Constructions.Transparent.SingleGlazingEgypt
      constructionWindow1,
    nZones=1,
    redeclare Data.Constructions.Transparent.SingleGlazingEgypt
      constructionWindow2,
    redeclare Data.Constructions.Transparent.SingleGlazingEgypt
      constructionWindow3,
    redeclare Data.Constructions.Transparent.SingleGlazingEgypt
      constructionWindow4)
    annotation (Placement(transformation(extent={{60,18},{80,38}})));
  BuildingSystems.Buildings.Ambient ambient(redeclare
      BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_Egypt_ElGouna
      weatherDataFile, nSurfaces=building.nSurfacesAmbient)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  BuildingSystems.Fluid.Sources.MassFlowSource_WeatherData bou
    annotation (Placement(transformation(extent={{52,-32},{72,-12}})));
  BuildingSystems.BoundaryConditions.WeatherData.ReaderTMY3 weaDat
    annotation (Placement(transformation(extent={{26,-22},{38,-10}})));
equation
  connect(ambient.TAirRef, building.TAirAmb) annotation (Line(points={{-79,77},{
          -88,77},{-88,54},{76,54},{76,37.8},{76.2,37.8}}, color={0,0,127}));
  connect(building.xAirAmb, ambient.xAir) annotation (Line(points={{78.4,37.8},{
          78.4,56},{-86,56},{-86,75},{-79,75}}, color={0,0,127}));
  connect(ambient.toSurfacePorts, building.toAmbientSurfacesPorts) annotation (
      Line(points={{-62,74},{-56,74},{-56,50},{56,50},{56,32},{61,32}}, color={0,
          255,0}));
  connect(ambient.toAirPorts, building.toAmbientAirPorts) annotation (Line(
        points={{-62,66},{-58,66},{-58,48},{54,48},{54,24},{61,24}}, color={85,170,
          255}));
  connect(building.airchange[1], ACH.y) annotation (Line(points={{79.8,32},{100,
          32},{100,22},{109.6,22}}, color={0,0,127}));
  connect(building.T_setCooling[1], TSetCooling.y) annotation (Line(points={{79.8,
          34},{100,34},{100,37},{111.7,37}}, color={0,0,127}));
  connect(building.T_setHeating[1], TSetHeating.y) annotation (Line(points={{79.8,
          36},{96,36},{96,51},{111.7,51}}, color={0,0,127}));
  connect(weaDat.weaBus, bou.weaBus) annotation (Line(
      points={{38,-16},{46,-16},{46,-21.8},{52,-21.8}},
      color={255,204,51},
      thickness=0.5));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{120,100}},
          initialScale=0.1)), Icon(coordinateSystem(extent={{-100,-100},{120,100}},
          initialScale=0.1)),
    experiment(StopTime=31536000));
end Test_Building;
