within PVBoat.System;
model PhotovoltaicSystem_26trips_onboat "PV system for a solar boat"
  extends Modelica.Icons.Example;
  BuildingSystems.Technologies.Photovoltaics.PVModules.PVModuleSimpleMPP pvField(
    redeclare BuildingSystems.Technologies.Photovoltaics.Data.PhotovoltaicModules.TSM230PC05 pvModuleData,
    angleDegAzi_constant=0.0,
    nModPar=3,
    nModSer=3,
    angleDegTil_constant=0)
    annotation (Placement(transformation(extent={{-56,34},{-36,54}})));
  BuildingSystems.Climate.WeatherData.WeatherDataNetcdf weatherData(redeclare
      BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_Egypt_ElGouna
      weatherDataFile)
    annotation(Placement(transformation(extent={{-86,72},{-74,84}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiation(
    rhoAmb = 0.2,
    angleDegL = 0.0)
    annotation (Placement(transformation(extent={{-66,60},{-54,72}})));
  BuildingSystems.Technologies.ElectricalStorages.BatterySimple battery(
    SOC_start=1,
    nBat=4,
    redeclare
      BuildingSystems.Technologies.ElectricalStorages.Data.LeadAcid.Chloride200Ah
      batteryData(PCharge_max=336))
    annotation (Placement(transformation(extent={{-30,42},{-10,62}})));
  Modelica.Blocks.Sources.CombiTimeTable                         SLP_July(
      extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic, table=[0,0.0001;
        29700,0.0001; 29700,2200; 29970,2200; 29970,0.0001; 30270,0.0001; 30270,
        1500; 30540,1500; 30540,0.0001; 30600,0.0001; 30600,2200; 30870,2200; 30870,
        0.0001; 30930,0.0001; 30930,1500; 31200,1500; 31200,0; 32400,0; 32400,2200;
        32670,2200; 32670,0.0001; 32970,0.0001; 32970,1500; 33240,1500; 33240,0.0001;
        33300,0.0001; 33300,2200; 33570,2200; 33570,0.0001; 33630,0.0001; 33630,
        1500; 33900,1500; 33900,0; 35100,0; 35100,2200; 35370,2200; 35370,0.0001;
        35670,0.0001; 35670,1500; 35940,1500; 35940,0.0001; 36000,0.0001; 36000,
        2200; 36270,2200; 36270,0.0001; 36330,0.0001; 36330,1500; 36600,1500; 36600,
        0; 37800,0; 37800,2200; 38070,2200; 38070,0.0001; 38370,0.0001; 38370,1500;
        38640,1500; 38640,0.0001; 38700,0.0001; 38700,2200; 38970,2200; 38970,0.0001;
        39030,0.0001; 39030,1500; 39300,1500; 39300,0; 40500,0; 40500,2200; 40770,
        2200; 40770,0.0001; 41070,0.0001; 41070,1500; 41340,1500; 41340,0.0001;
        41400,0.0001; 41400,2200; 41670,2200; 41670,0.0001; 41730,0.0001; 41730,
        1500; 42000,1500; 42000,0; 43200,0; 43200,2200; 43470,2200; 43470,0.0001;
        43770,0.0001; 43770,1500; 44040,1500; 44040,0.0001; 44100,0.0001; 44100,
        2200; 44370,2200; 44370,0.0001; 44430,0.0001; 44430,1500; 44700,1500; 44700,
        0; 45900,0; 45900,2200; 46170,2200; 46170,0.0001; 46470,0.0001; 46470,1500;
        46740,1500; 46740,0.0001; 46800,0.0001; 46800,2200; 47070,2200; 47070,0.0001;
        47130,0.0001; 47130,1500; 47400,1500; 47400,0; 48600,0; 48600,2200; 48870,
        2200; 48870,0.0001; 49170,0.0001; 49170,1500; 49440,1500; 49440,0.0001;
        49500,0.0001; 49500,2200; 49770,2200; 49770,0.0001; 49830,0.0001; 49830,
        1500; 50100,1500; 50100,0; 51300,0; 51300,2200; 51570,2200; 51570,0.0001;
        51870,0.0001; 51870,1500; 52140,1500; 52140,0.0001; 52200,0.0001; 52200,
        2200; 52470,2200; 52470,0.0001; 52530,0.0001; 52530,1500; 52800,1500; 52800,
        0; 54000,0; 54000,2200; 54270,2200; 54270,0.0001; 54570,0.0001; 54570,1500;
        54840,1500; 54840,0.0001; 54900,0.0001; 54900,2200; 55170,2200; 55170,0.0001;
        55230,0.0001; 55230,1500; 55500,1500; 55500,0; 56700,0; 56700,2200; 56970,
        2200; 56970,0.0001; 57270,0.0001; 57270,1500; 57540,1500; 57540,0.0001;
        57600,0.0001; 57600,2200; 57870,2200; 57870,0.0001; 57930,0.0001; 57930,
        1500; 58200,1500; 58200,0; 59400,0; 59400,2200; 59670,2200; 59670,0.0001;
        59970,0.0001; 59970,1500; 60240,1500; 60240,0.0001; 60300,0.0001; 60300,
        2200; 60570,2200; 60570,0.0001; 60630,0.0001; 60630,1500; 60900,1500; 60900,
        0; 62100,0; 62100,2200; 62370,2200; 62370,0.0001; 62670,0.0001; 62670,1500;
        62940,1500; 62940,0.0001; 63000,0.0001; 63000,2200; 63270,2200; 63270,0.0001;
        63330,0.0001; 63330,1500; 63600,1500; 63600,0.0001; 86399,0.0001])
    annotation (Placement(transformation(extent={{46,42},{34,54}})));
  Modelica.Blocks.Math.Gain load(k=1)
    annotation (Placement(transformation(extent={{26,46},{14,58}})));
  Modelica.Blocks.Continuous.Integrator EField(y(displayUnit="kWh"))
    "Generated electricity by the PV field"
    annotation (Placement(transformation(extent={{-36,76},{-28,84}})));
  Modelica.Blocks.Continuous.Integrator EGrid(y(displayUnit="kWh"))
    "Electricty taken from the grid"
    annotation (Placement(transformation(extent={{-8,76},{0,84}})));
  Modelica.Blocks.Continuous.Integrator Eload(y(displayUnit="kWh"))
    "Electricty demand"
    annotation (Placement(transformation(extent={{14,76},{22,84}})));
equation
  connect(radiation.radiationPort, pvField.radiationPort)
    annotation (Line(points={{-55.2,65.88},{-46,65.88},{-46,52}},color={255,255,0},smooth=Smooth.None));
  connect(pvField.angleDegTil, radiation.angleDegTil) annotation (Line(
    points={{-52,52},{-70,52},{-70,64.8},{-64.56,64.8}}, color={0,0,127}));
  connect(pvField.angleDegAzi, radiation.angleDegAzi) annotation (Line(
    points={{-52,50},{-68,50},{-68,62.4},{-64.56,62.4}}, color={0,0,127}));
  connect(pvField.PField, battery.PCharge)
    annotation (Line(points={{-40,52},{-25,52}}, color={0,0,127}));
  connect(battery.PLoad, load.y)
    annotation (Line(points={{-15,52},{13.4,52}}, color={0,0,127}));
  connect(pvField.PField, EField.u) annotation (Line(points={{-40,52},{-40,52},{
          -40,80},{-36.8,80}}, color={0,0,127}));
  connect(battery.PGrid, EGrid.u) annotation (Line(points={{-14.6,56},{-12,56},{
          -12,80},{-8.8,80}}, color={0,0,127}));
  connect(load.y, Eload.u) annotation (Line(points={{13.4,52},{10,52},{10,80},{13.2,
          80}}, color={0,0,127}));
  connect(weatherData.latitudeDeg, radiation.latitudeDeg) annotation (Line(
          points={{-73.4,83.4},{-70,83.4},{-70,82},{-62.28,82},{-62.28,70.56}},
          color={0,0,127}));
  connect(weatherData.longitudeDeg, radiation.longitudeDeg) annotation (Line(
          points={{-73.4,82.2},{-70,82.2},{-70,82},{-60,82},{-60,70.56}}, color={0,
            0,127}));
  connect(weatherData.longitudeDeg0, radiation.longitudeDeg0) annotation (Line(
          points={{-73.4,81},{-70,81},{-70,82},{-57.6,82},{-57.6,70.56}}, color={0,
            0,127}));
  connect(weatherData.TAirRef, pvField.TAmb) annotation (Line(points={{-84.2,71.4},
          {-84.2,56},{-44,56},{-44,52}}, color={0,0,127}));
  connect(weatherData.IrrDirHor, radiation.IrrDirHor) annotation (Line(points={{
          -81.8,71.4},{-81.8,69.6},{-64.56,69.6}}, color={0,0,127}));
  connect(weatherData.IrrDifHor, radiation.IrrDifHor) annotation (Line(points={{
          -80.6,71.4},{-80.6,67.2},{-64.56,67.2}}, color={0,0,127}));

  connect(SLP_July.y[1], load.u) annotation (Line(points={{33.4,48},{30,48},{30,
          52},{27.2,52}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,0},{60,100}})),
    experiment(StopTime=31536000, __Dymola_NumberOfIntervals=8670),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Applications/PhotovoltaicSystems/PhotovoltaicSystem.mos" "Simulate and plot"),
Documentation(info="<html>
<p> Example that simulates a photovoltaic system for a private household in Germany in summer (July). The system
has a PV generator of 2.3 kWpeak and an electrical battery pack with 3 x 2.88 kWh. The household has a yearly electricty demand
of 3000 kWh, whereby the electrical load is distributed over the German standard load profile (SLP) for residential buildings.
</p>
</html>", revisions="<html>
<ul>
<li>
June 14, 2018, by Christoph Nytsch-Geusen:<br/>
Adaptation to the new interfaces of the weather data reader.
</li>
<li>
July 5, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end PhotovoltaicSystem_26trips_onboat;
