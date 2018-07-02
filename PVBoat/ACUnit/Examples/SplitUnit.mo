within SPACS_Matrix.ACUnit.Examples;
model SplitUnit
  extends Modelica.Icons.Example;
  package Medium1 = BuildingSystems.Media.Air;
  .SPACS_Matrix.ACUnit.SplitUnit splitUnit(nPorts_splitUnit=2)
    annotation (Placement(transformation(extent={{-28,18},{28,74}})));
  Modelica.Blocks.Sources.Constant TSetCooling(k=273.15 + 23)
    annotation (Placement(transformation(extent={{54,34},{40,48}})));
  BuildingSystems.Fluid.Sources.Boundary_pT
                                        bou(redeclare package Medium = Medium1,
      nPorts=2,
    T=273.15 + 40,
    p=101300,
    use_T_in=true)
                annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={0,-26})));

  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package
      Medium = Medium1, m_flow_nominal=1)
    annotation (Placement(transformation(extent={{-5,-6},{5,6}},
        rotation=90,
        origin={-5,0})));
  BuildingSystems.Climate.WeatherData.WeatherDataNetcdf weaDat(redeclare
      BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_Egypt_ElGouna
      weatherDataFile)
    annotation (Placement(transformation(extent={{-12,-56},{8,-76}})));
equation
  connect(TSetCooling.y, splitUnit.T_setCooling) annotation (Line(points={{39.3,41},
          {32,41},{32,51.6},{23.52,51.6}},     color={0,0,127}));
  connect(senTem.port_b, splitUnit.ports_splitUnit[1]) annotation (Line(points={{-5,5},{
          -4.76,5},{-4.76,23.6}},             color={0,127,255}));
  connect(bou.ports[1], splitUnit.ports_splitUnit[2]) annotation (Line(points={{2,-16},
          {4.76,-16},{4.76,23.6}},        color={0,127,255}));
  connect(bou.ports[2], senTem.port_a) annotation (Line(points={{-2,-16},{-4,
          -16},{-4,-5},{-5,-5}}, color={0,127,255}));
  connect(weaDat.TAirRef, bou.T_in) annotation (Line(points={{-9,-55},{-9,-46},
          {4,-46},{4,-38}}, color={0,0,127}));
  connect(weaDat.TAirRef, splitUnit.T_amb) annotation (Line(points={{-9,-55},{
          -9,-46},{68,-46},{68,62.8},{23.52,62.8}}, color={0,0,127}));
  annotation (experiment(StopTime=31536000),
                                          __Dymola_Commands(file=
          "Resources/Scripts/Dymola/ACUnit/SplitUnit.mos" "Simulate and Plot"));
end SplitUnit;
