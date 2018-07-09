within PVBoat.System;
model PhotovoltaicSystem_gridcharge_at_hotel_Night_and_betweencommutes_26trip
  "PV system for a private household with an electrical house battery"
  extends Modelica.Icons.Example;
  Modelica.SIunits.Energy EBoatload(displayUnit = "kWh");
  Modelica.SIunits.Energy E_grid(displayUnit = "kWh");
  Modelica.SIunits.Energy E_inputfromGrid(displayUnit = "kWh");
  BuildingSystems.Technologies.ElectricalStorages.BatterySimple battery(
    SOC_start=1,
    nBat=4,
    redeclare
      BuildingSystems.Technologies.ElectricalStorages.Data.LeadAcid.Chloride200Ah
      batteryData(PCharge_max=336))
    annotation (Placement(transformation(extent={{-30,42},{-10,62}})));
  Modelica.Blocks.Sources.CombiTimeTable                         BoatLoad(
      extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic, table=[0,0;
        29700,0; 29700,2200; 29970,2200; 29970,0.0001; 30270,0.0001; 30270,1500;
        30540,1500; 30540,0.0001; 30600,0.0001; 30600,2200; 30870,2200; 30870,
        0.0001; 30930,0.0001; 30930,1500; 31200,1500; 31200,0; 32400,0; 32400,
        2200; 32670,2200; 32670,0.0001; 32970,0.0001; 32970,1500; 33240,1500;
        33240,0.0001; 33300,0.0001; 33300,2200; 33570,2200; 33570,0.0001; 33630,
        0.0001; 33630,1500; 33900,1500; 33900,0; 35100,0; 35100,2200; 35370,
        2200; 35370,0.0001; 35670,0.0001; 35670,1500; 35940,1500; 35940,0.0001;
        36000,0.0001; 36000,2200; 36270,2200; 36270,0.0001; 36330,0.0001; 36330,
        1500; 36600,1500; 36600,0; 37800,0; 37800,2200; 38070,2200; 38070,
        0.0001; 38370,0.0001; 38370,1500; 38640,1500; 38640,0.0001; 38700,
        0.0001; 38700,2200; 38970,2200; 38970,0.0001; 39030,0.0001; 39030,1500;
        39300,1500; 39300,0; 40500,0; 40500,2200; 40770,2200; 40770,0.0001;
        41070,0.0001; 41070,1500; 41340,1500; 41340,0.0001; 41400,0.0001; 41400,
        2200; 41670,2200; 41670,0.0001; 41730,0.0001; 41730,1500; 42000,1500;
        42000,0; 43200,0; 43200,2200; 43470,2200; 43470,0.0001; 43770,0.0001;
        43770,1500; 44040,1500; 44040,0.0001; 44100,0.0001; 44100,2200; 44370,
        2200; 44370,0.0001; 44430,0.0001; 44430,1500; 44700,1500; 44700,0;
        45900,0; 45900,2200; 46170,2200; 46170,0.0001; 46470,0.0001; 46470,1500;
        46740,1500; 46740,0.0001; 46800,0.0001; 46800,2200; 47070,2200; 47070,
        0.0001; 47130,0.0001; 47130,1500; 47400,1500; 47400,0; 48600,0; 48600,
        2200; 48870,2200; 48870,0.0001; 49170,0.0001; 49170,1500; 49440,1500;
        49440,0.0001; 49500,0.0001; 49500,2200; 49770,2200; 49770,0.0001; 49830,
        0.0001; 49830,1500; 50100,1500; 50100,0; 51300,0; 51300,2200; 51570,
        2200; 51570,0.0001; 51870,0.0001; 51870,1500; 52140,1500; 52140,0.0001;
        52200,0.0001; 52200,2200; 52470,2200; 52470,0.0001; 52530,0.0001; 52530,
        1500; 52800,1500; 52800,0; 54000,0; 54000,2200; 54270,2200; 54270,
        0.0001; 54570,0.0001; 54570,1500; 54840,1500; 54840,0.0001; 54900,
        0.0001; 54900,2200; 55170,2200; 55170,0.0001; 55230,0.0001; 55230,1500;
        55500,1500; 55500,0; 56700,0; 56700,2200; 56970,2200; 56970,0.0001;
        57270,0.0001; 57270,1500; 57540,1500; 57540,0.0001; 57600,0.0001; 57600,
        2200; 57870,2200; 57870,0.0001; 57930,0.0001; 57930,1500; 58200,1500;
        58200,0; 59400,0; 59400,2200; 59670,2200; 59670,0.0001; 59970,0.0001;
        59970,1500; 60240,1500; 60240,0.0001; 60300,0.0001; 60300,2200; 60570,
        2200; 60570,0.0001; 60630,0.0001; 60630,1500; 60900,1500; 60900,0;
        62100,0; 62100,2200; 62370,2200; 62370,0.0001; 62670,0.0001; 62670,1500;
        62940,1500; 62940,0.0001; 63000,0.0001; 63000,2200; 63270,2200; 63270,
        0.0001; 63330,0.0001; 63330,1500; 63600,1500; 63600,0; 86399,0])
    annotation (Placement(transformation(extent={{46,42},{34,54}})));
  Modelica.Blocks.Logical.Less less
    annotation (Placement(transformation(extent={{-40,12},{-60,32}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-64,42},{-44,62}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-98,50},{-78,70}})));
  Modelica.Blocks.Sources.Constant PowerfromGrid(k=1000)
    annotation (Placement(transformation(extent={{-98,20},{-78,40}})));
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-18,24},{-32,38}})));
equation
  der(EBoatload)=BoatLoad.y[1];
  der(E_grid)=battery.PGrid;
  der(E_inputfromGrid)=PowerfromGrid.y;

  connect(switch1.y, battery.PCharge)
    annotation (Line(points={{-43,52},{-25,52}}, color={0,0,127}));
  connect(const.y, switch1.u1)
    annotation (Line(points={{-77,60},{-66,60}}, color={0,0,127}));
  connect(PowerfromGrid.y, switch1.u3) annotation (Line(points={{-77,30},{-72,30},
          {-72,44},{-66,44}}, color={0,0,127}));
  connect(less.y, switch1.u2) annotation (Line(points={{-61,22},{-74,22},{-74,
          52},{-66,52}}, color={255,0,255}));
  connect(const2.y, less.u1) annotation (Line(points={{-32.7,31},{-34,31},{-34,
          22},{-38,22}},
                     color={0,0,127}));
  connect(BoatLoad.y[1], battery.PLoad) annotation (Line(points={{33.4,48},{10,48},
          {10,52},{-15,52}}, color={0,0,127}));
  connect(less.u2, BoatLoad.y[1]) annotation (Line(points={{-38,14},{-2,14},{-2,
          48},{33.4,48}}, color={0,0,127}));
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
end PhotovoltaicSystem_gridcharge_at_hotel_Night_and_betweencommutes_26trip;
