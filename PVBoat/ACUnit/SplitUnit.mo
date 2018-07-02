within SPACS_Matrix.ACUnit;
model SplitUnit
  package Medium1 = BuildingSystems.Media.Air;
  package Medium2 = BuildingSystems.Media.Water;
//   replaceable parameter BuildingSystems.Technologies.Chillers.Data.CompressionChillers.CompressionChillerGeneral chillerData
//     "Characteristic data of the chiller"
//     annotation(Dialog(tab = "General"),Evaluate=true, choicesAllMatching=true);

  parameter Real Qdot_cool = 3000 "rated cooling capacity of split unit";
  parameter Real hysteresis = 4 "On/Off hysteresis of SplitUnit";
  parameter Integer nPorts_splitUnit=2 "Number of air ports to/from split unit"
      annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));


  BuildingSystems.Fluid.Sources.Boundary_pT ambient_ex(
    nPorts=1,
    redeclare package Medium = Medium1,
    use_T_in=true,
    p=101300) annotation (Placement(transformation(extent={{-50,44},{-38,56}})));
  BuildingSystems.Fluid.HeatPumps.Carnot_TCon compressor(
    m1_flow_nominal=1,
    m2_flow_nominal=1,
    dp1_nominal=200,
    dp2_nominal=200,
    dTEva_nominal=-4,
    etaCarnot_nominal=0.3,
    dTCon_nominal=10,
    use_eta_Carnot_nominal=false,
    redeclare package Medium1 = Medium1,
    redeclare package Medium2 = Medium1,
    QCon_flow_nominal=3000)
    annotation (Placement(transformation(extent={{24,10},{-24,60}})));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow RCAfan(redeclare package
      Medium = Medium1, m_flow_nominal=0.5) annotation (Placement(
        transformation(
        extent={{-16,-16},{16,16}},
        rotation=-90,
        origin={24,-38})));
  Modelica.Blocks.Math.BooleanToReal controllerRCA(realTrue=0.5, realFalse=0.01)
    annotation (Placement(transformation(
        extent={{4,-4},{-4,4}},
        rotation=90,
        origin={62,-28})));
  BuildingSystems.Interfaces.Temp_KInput T_setCooling
    annotation (Placement(transformation(extent={{100,4},{68,36}}),
        iconTransformation(extent={{100,4},{68,36}})));
  BuildingSystems.Interfaces.Temp_KInput T_amb
    annotation (Placement(transformation(extent={{100,44},{68,76}}),
        iconTransformation(extent={{100,44},{68,76}})));
  Modelica.Blocks.Logical.OnOffController controllerOnOff(bandwidth=hysteresis,
      pre_y_start=false)
    annotation (Placement(transformation(extent={{36,-16},{48,-4}})));
  Modelica.Blocks.Math.Gain gain(k=-1)
    annotation (Placement(transformation(extent={{4,-16},{10,-10}})));
  Modelica.Blocks.Math.Gain gain1(k=-1)
    annotation (Placement(transformation(extent={{54,16},{48,22}})));
  BuildingSystems.Interfaces.PowerOutput powerDemand annotation (Placement(
        transformation(extent={{-68,44},{-100,76}}), iconTransformation(extent=
            {{-68,44},{-100,76}})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b ports_splitUnit[nPorts_splitUnit](
      redeclare package Medium = Medium1) "Split unit room air in- and outlets"
    annotation (Placement(transformation(extent={{-34,-88},{34,-72}})));

  BuildingSystems.Fluid.Sensors.Temperature senTem_RCAin(redeclare package
      Medium = Medium1)
    annotation (Placement(transformation(extent={{-18,-22},{0,-4}})));
  Modelica.Blocks.Math.BooleanToReal controllerCompressor(realFalse=0.0,
      realTrue=1) annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=90,
        origin={63,29})));
  BuildingSystems.Fluid.Sensors.Temperature senTem_RCAout(redeclare package
      Medium = Medium1)
    annotation (Placement(transformation(extent={{6,-6},{18,6}})));
  BuildingSystems.Fluid.Sensors.Temperature senTem_condOut(redeclare package
      Medium = Medium1)
    annotation (Placement(transformation(extent={{-42,66},{-24,84}})));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow ODAfan(redeclare package
      Medium = Medium1, m_flow_nominal=0.5) annotation (Placement(
        transformation(
        extent={{-7,-7},{7,7}},
        rotation=180,
        origin={39,45})));
  BuildingSystems.Fluid.Sources.Boundary_pT ambient_in(
    nPorts=1,
    redeclare package Medium = Medium1,
    use_T_in=true,
    p=101300,
    T=293.15) annotation (Placement(transformation(extent={{58,42},{50,50}})));
  Modelica.Blocks.Math.BooleanToReal controllerODA(realTrue=0.5, realFalse=0.01)
    annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=90,
        origin={39,29})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{56,58},{44,70}})));
  Modelica.Blocks.Sources.Constant const(k=10)
    annotation (Placement(transformation(extent={{80,76},{72,84}})));
equation
  connect(controllerRCA.y, RCAfan.m_flow_in)
    annotation (Line(points={{62,-32.4},{62,-38},{43.2,-38}},color={0,0,127}));
  connect(controllerRCA.u, controllerOnOff.y) annotation (Line(points={{62,
          -23.2},{62,-10},{48.6,-10}}, color={255,0,255}));
  connect(gain.y, controllerOnOff.u) annotation (Line(points={{10.3,-13},{34,
          -13},{34,-13.6},{34.8,-13.6}}, color={0,0,127}));
  connect(controllerOnOff.reference, gain1.y) annotation (Line(points={{34.8,
          -6.4},{30,-6.4},{30,19},{47.7,19}}, color={0,0,127}));
  connect(T_setCooling, gain1.u) annotation (Line(points={{84,20},{84,19},{54.6,
          19}},              color={0,0,127}));
  connect(compressor.P, powerDemand) annotation (Line(points={{-26.4,35},{-60,35},
          {-60,60},{-84,60}}, color={0,0,127}));
  connect(compressor.port_b2, RCAfan.port_a) annotation (Line(points={{24,20},{24,
          -22}},               color={0,127,255}));
  connect(compressor.port_b1, ambient_ex.ports[1])
    annotation (Line(points={{-24,50},{-38,50}}, color={0,127,255}));
  connect(compressor.port_a2, ports_splitUnit[1]) annotation (Line(points={{-24,
          20},{-32,20},{-32,-60},{-17,-60},{-17,-80}}, color={0,127,255}));
  connect(RCAfan.port_b, ports_splitUnit[2]) annotation (Line(points={{24,-54},{
          24,-60},{17,-60},{17,-80}}, color={0,127,255}));
  connect(compressor.port_a2, senTem_RCAin.port) annotation (Line(points={{-24,20},
          {-32,20},{-32,-22},{-9,-22}}, color={0,127,255}));
  connect(senTem_RCAin.T, gain.u)
    annotation (Line(points={{-2.7,-13},{3.4,-13}},  color={0,0,127}));
  connect(controllerOnOff.y, controllerCompressor.u) annotation (Line(points={{
          48.6,-10},{62,-10},{62,24},{63,24},{63,25.4}}, color={255,0,255}));
  connect(compressor.port_b2, senTem_RCAout.port)
    annotation (Line(points={{24,20},{24,-6},{12,-6}}, color={0,127,255}));
  connect(senTem_condOut.port, compressor.port_b1) annotation (Line(points={{-33,
          66},{-34,66},{-34,50},{-24,50}}, color={0,127,255}));
  connect(ODAfan.port_b, compressor.port_a1) annotation (Line(points={{32,45},{
          30,45},{30,50},{24,50}}, color={0,127,255}));
  connect(ambient_in.ports[1], ODAfan.port_a)
    annotation (Line(points={{50,46},{50,45},{46,45}}, color={0,127,255}));
  connect(ambient_in.T_in, T_amb) annotation (Line(points={{58.8,47.6},{68,47.6},
          {68,60},{84,60}}, color={0,0,127}));
  connect(ambient_ex.T_in, T_amb) annotation (Line(points={{-51.2,52.4},{-52,
          52.4},{-52,52},{-56,52},{-56,92},{68,92},{68,60},{84,60}}, color={0,0,
          127}));
  connect(ODAfan.m_flow_in, controllerODA.y)
    annotation (Line(points={{39,36.6},{39,32.3}}, color={0,0,127}));
  connect(controllerOnOff.y, controllerODA.u) annotation (Line(points={{48.6,
          -10},{62,-10},{62,24},{39,24},{39,25.4}}, color={255,0,255}));
  connect(T_amb, add.u2) annotation (Line(points={{84,60},{70,60},{70,60.4},{
          57.2,60.4}}, color={0,0,127}));
  connect(add.y, compressor.TSet) annotation (Line(points={{43.4,64},{40,64},{
          40,57.5},{28.8,57.5}}, color={0,0,127}));
  connect(const.y, add.u1) annotation (Line(points={{71.6,80},{64,80},{64,67.6},
          {57.2,67.6}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(extent={{-80,80},{80,-80}}, lineColor={0,0,0}),
        Ellipse(extent={{-36,62},{36,-10}}, lineColor={0,0,0}),
        Line(points={{-12,60},{-30,6}}, color={0,0,0}),
        Line(points={{12,60},{30,6}}, color={0,0,0}),
        Rectangle(extent={{-70,-26},{68,-72}}, lineColor={0,0,0}),
        Line(points={{-70,-26},{68,-72}}, color={0,0,0}),
        Line(points={{-70,-72},{68,-26}}, color={0,0,0}),
        Text(
          extent={{-80,114},{80,82}},
          lineColor={28,108,200},
          textString="%name")}),                            Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    __Dymola_Commands(file="Resources/Scripts/Dymola/ACUnit/Test_SplitUnit.mos"
        "Simulate and Plot"));
end SplitUnit;
