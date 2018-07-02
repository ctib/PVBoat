within PVBoat.ElectricalStorages;
model Test_BatteryLeadAcid "Example of the extended electrical battery model"
  extends Modelica.Icons.Example;
  BatteryComplexIA battery(
    nBat=1,
    SOC_start=1,
    redeclare Data.LeadAcid.Chloride200Ah batteryData)
    annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
  Modelica.Blocks.Sources.Pulse gain(
    period=3600,
    width=100,
    amplitude=0,
    startTime=0)
    annotation (Placement(transformation(extent={{-84,56},{-76,64}})));
  Modelica.Blocks.Sources.Pulse load(
    startTime=100,
    period(displayUnit="s") = 3600,
    offset=0,
    width=100,
    nperiod=-1,
    amplitude=2575.2)
             annotation (Placement(transformation(extent={{-36,56},{-44,64}})));

  Modelica.Blocks.Sources.TimeTable dischargeRate_1C(
    offset=0,
    startTime=100,
    table=[0,11.820296; 60.43902,11.820296; 86.388822,11.830867; 126.210696,
        11.799154; 180.39993,11.756871; 265.48566,11.661734; 382.24989,
        11.5560255; 550.36866,11.408033; 804.06702,11.164905; 1140.94926,
        10.84778; 1339.4334,10.6469345; 1505.14776,10.446089; 1630.8219,
        10.276956; 1741.41252,10.033827; 1806.0606,9.896406; 1859.50278,
        9.632135; 1860,9.632135])
    "Datasheet: discharge curve at 1.073C (2575.2 W)"
    annotation (Placement(transformation(extent={{-86,82},{-74,94}})));
  Modelica.Blocks.Sources.TimeTable dischargeRate_C10(
    offset=0,
    startTime=100,
    table=[0,12.4842; 60.25878,12.4842; 113.41605,12.472632; 231.237972,
        12.47146; 481.8492,12.459726; 1212.94524,12.437154; 2367.40812,
        12.404475; 3556.752,12.372226; 6090.3444,12.28713; 8759.16,12.202322;
        11629.1784,12.096593; 14673.3582,11.969894; 17216.3142,11.843316;
        20495.118,11.674608; 23020.353,11.527048; 26426.1402,11.347874;
        29897.463,11.147671; 33095.67,10.968556; 36107.214,10.789466; 36120,
        10.789466]) "Datasheet: discharge curve at 0.1C (240 W)"
    annotation (Placement(transformation(extent={{-66,82},{-54,94}})));
  Modelica.Blocks.Sources.TimeTable dischargeRate_C20(
    offset=0,
    startTime=100,
    table=[0,12.6942005; 60,12.6942005; 120.37482,12.6942005; 231.217704,
        12.6942005; 349.59228,12.6942005; 484.512,12.6942005; 593.60838,
        12.6942005; 1208.3259,12.683656; 2372.02356,12.673111; 3534.7614,
        12.652021; 6045.7206,12.620387; 11612.7072,12.514938; 24689.7456,
        12.282952; 30249.072,12.16696; 35740.314,12.050966; 41319.504,11.913884;
        46403.688,11.787346; 51736.86,11.639719; 55628.64,11.471002; 59380.926,
        11.31283; 62928.252,11.165202; 65727.138,11.017574; 69150.222,10.848858;
        69180,10.848858]) "Datasheet: discharge curve at 0.0535C (128.4 W)"
    annotation (Placement(transformation(extent={{-46,82},{-34,94}})));
equation
  connect(battery.PCharge, gain.y) annotation (Line(
      points={{-65,60},{-75.6,60}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(load.y, battery.PLoad)
    annotation (Line(points={{-44.4,60},{-55,60}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,0},
  {-20,100}}), graphics={
    Text(extent={{-60,22},{-60,18}},lineColor={0,0,255},fontSize=22,
          textString="Test of the extended kinetic battery model KiBaM")}),
    experiment(StopTime=180000, __Dymola_NumberOfIntervals=50000),
    __Dymola_Commands(file=
          "Resources/Scripts/Dymola/ElectricalStorages/Test_BatteryLeadAcid.mos"
        "Simulate and plot"),
Documentation(info="<html>
<p> This example tests the implementation of
<a href=\"modelica://BuildingSystems.Technologies.Electrica.Batteries\">
BuildingSystems.Technologies.Electrical.Batteries</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
March 17, 2018, by Christoph Banhardt:<br/>
updated to see limits of available energy Eava
<li>
June 16, 2015, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"),
    __Dymola_experimentSetupOutput,
    __Dymola_experimentFlags(
      Advanced(GenerateVariableDependencies=false, OutputModelicaCode=false),
      Evaluate=false,
      OutputCPUtime=true,
      OutputFlatModelica=false));
end Test_BatteryLeadAcid;
