within SPACS_Matrix.Buildings;
model SingleApartment_old
  extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
    nZones=1,
    surfacesToAmbient(nSurfaces=6),
    useAirPathes = true,
    convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced);
  record Construction
    extends
      BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction(
    nLayers=2,
    thickness={0.1,0.1},
    material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Beton(),
      BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Beton()});
  end Construction;
  BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone1(
    V = 4.0*4.0*2.5,
    height = 2.5,
    nConstructions2=2,
    nConstructions1=1,
    nConstructions4=2,
    nConstructions3=1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall1(
    height=2.5,
    width=4.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall3(
    height=2.5,
    width=4.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall2(
    height=2.5,
    width=4.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    AInnSur=window2.ASur,
    redeclare Construction constructionData)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-12,20})));
  BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall4(
    height=2.5,
    width=4.0,
    angleDegAzi=0.0,
    angleDegTil=90.0,
    AInnSur=window4.ASur,
    redeclare Construction constructionData)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-12,-20})));
  BuildingSystems.Buildings.Constructions.Windows.Window window2(
    height=1.0,
    width=2.0,
    angleDegAzi=180.0,
    angleDegTil=90.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={12,20})));
  BuildingSystems.Buildings.Constructions.Windows.Window window4(
    height=1.0,
    width=2.0,
    angleDegAzi=0.0,
    angleDegTil=90.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={12,-20})));
equation
 connect(wall2.toSurfacePort_1, zone1.toConstructionPorts2[1]) annotation (
      Line(
      points={{-12,18},{2,18},{2,11},{6,11}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(wall1.toSurfacePort_2, zone1.toConstructionPorts1[1]) annotation (
      Line(
      points={{-18,0},{-16,0},{-16,4},{-11,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(wall4.toSurfacePort_2, zone1.toConstructionPorts4[1]) annotation (
      Line(
      points={{-12,-18},{-12,-14},{-2,-14},{-2,-11}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(window2.toSurfacePort_1, zone1.toConstructionPorts2[2]) annotation (
      Line(
      points={{12,18},{10,18},{10,11},{2,11}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(window4.toSurfacePort_2, zone1.toConstructionPorts4[2]) annotation (
      Line(
      points={{12,-18},{12,-16},{-6,-16},{-6,-11}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(wall3.toSurfacePort_1, zone1.toConstructionPorts3[1]) annotation (
      Line(
      points={{18,0},{14,0},{14,-4},{11,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surfacesToAmbient.toConstructionPorts[1], wall1.toSurfacePort_1)
    annotation (Line(
      points={{-173.9,3.10862e-15},{-55.95,3.10862e-15},{-55.95,0},{-22,0}},
      color={127,0,0},
      smooth=Smooth.None));
  connect(surfacesToAmbient.toConstructionPorts[2], wall2.toSurfacePort_2)
    annotation (Line(
      points={{-173.9,0},{-40,0},{-40,28},{-12,28},{-12,22}},
      color={127,0,0},
      smooth=Smooth.None));
  connect(surfacesToAmbient.toConstructionPorts[3], window2.toSurfacePort_2)
    annotation (Line(
      points={{-173.9,0},{-40,0},{-40,28},{12,28},{12,22}},
      color={127,0,0},
      smooth=Smooth.None));
  connect(surfacesToAmbient.toConstructionPorts[4], wall3.toSurfacePort_2)
    annotation (Line(
      points={{-173.9,0},{-40,0},{-40,28},{30,28},{30,0},{22,0}},
      color={127,0,0},
      smooth=Smooth.None));
  connect(surfacesToAmbient.toConstructionPorts[5], window4.toSurfacePort_1)
    annotation (Line(
      points={{-173.9,0},{-40,0},{-40,-30},{12,-30},{12,-22}},
      color={127,0,0},
      smooth=Smooth.None));
  connect(surfacesToAmbient.toConstructionPorts[6], wall4.toSurfacePort_1)
    annotation (Line(
      points={{-173.9,0},{-40,0},{-40,-30},{-12,-30},{-12,-22}},
      color={127,0,0},
      smooth=Smooth.None));
  connect(zone1.T_setCooling, T_setCooling[1]) annotation (Line(
      points={{5,7},{8,7},{8,-12},{80,-12},{80,60},{180,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(zone1.T_setHeating, T_setHeating[1]) annotation (Line(
      points={{1,7},{1,-14},{74,-14},{74,80},{180,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(zone1.airchange, airchange[1]) annotation (Line(
    points={{11,7},{14,7},{14,12},{86,12},{86,40},{180,40}},
    color={0,0,127},
    smooth=Smooth.None));
  connect(zone1.xAirAmb, xAirAmb) annotation (Line(
    points={{11,3},{16,3},{16,10},{70,10},{70,120}},
    color={0,0,127},
    smooth=Smooth.None));
  connect(TAirAmb, zone1.TAirAmb) annotation (Line(
    points={{50,120},{50,14},{14,14},{14,5},{11,5}},
    color={0,0,127},
    smooth=Smooth.None));
  connect(zone1.Q_flow_cooling, Q_flow_cooling[1]) annotation (Line(
    points={{7,7},{7,-80},{-80,-80},{-80,-122}},
    color={0,0,127},
    smooth=Smooth.None));
  connect(zone1.Q_flow_heating, Q_flow_heating[1]) annotation (Line(
    points={{3,7},{3,-34},{80,-34},{80,-122}},
    color={0,0,127},
    smooth=Smooth.None));

end SingleApartment_old;
