within PVBoat.Photovoltaics;
model IVCurveParameterOptimization
  "Example to optimize PV Module paramters (Rser, Rpar, c1, c2, cs1, cs2) with GenOpt"
  extends Modelica.Icons.Example;
  BuildingSystems.Technologies.Photovoltaics.PVModules.PVModuleComplex pvField(
    angleDegAzi_constant=0.0,
    nModPar=1,
    nModSer=1,
    angleDegTil_constant=0,
    redeclare SPACS_Matrix.Photovoltaics.Data.PhotovoltaicModules.SpectraVolt100M36S pvModuleData)
    annotation (Placement(transformation(extent={{-56,34},{-36,54}})));
  Modelica.Blocks.Math.UnitConversions.From_degC from_degC
    annotation (Placement(transformation(extent={{-60,68},{-52,76}})));
  BuildingSystems.Climate.Sources.RadiationFixed constRadiation(IrrDir_constant=pvField.pvModuleData.ITot)
    "direct horizontal radiation on module surface"
    annotation (Placement(transformation(extent={{-80,52},{-64,68}})));
  Modelica.Blocks.Sources.Constant constTemp(k=pvField.pvModuleData.TCel)
    "Module temperature at test conditions"
    annotation (Placement(transformation(extent={{-76,68},{-68,76}})));
  Modelica.Blocks.Sources.TimeTable IVcurve_reference(table=pvField.pvModuleData.UI)
    annotation (Placement(transformation(extent={{-24,18},{-32,26}})));

  Modelica.Blocks.Sources.Ramp increasVoltage(height=pvField.pvModuleData.Ul0,
      duration=pvField.pvModuleData.Ul0)
    "Increasing voltage until open circuit voltage"
    annotation (Placement(transformation(extent={{-24,46},{-32,54}})));
  Modelica.Blocks.Math.MultiSum ISum(k={1,-1}, nu=2)
    annotation (Placement(transformation(extent={{-38,26},{-42,30}})));
  Modelica.Blocks.Math.Product Idiff_sq
    annotation (Placement(transformation(extent={{-46,26},{-50,30}})));
  Modelica.Blocks.Math.Sqrt sqrt1
    annotation (Placement(transformation(extent={{-58,26},{-62,30}})));
  Modelica.Blocks.Continuous.Integrator Idiff_sum
    annotation (Placement(transformation(extent={{-52,26},{-56,30}})));
//   Real sz[:] = size(pvField.pvModuleData.UI)
//   "read the size of the UI table in PV Module data";
//   Real Ik0 = pvField.pvModuleData.Ik0
//   "get short circuit current from PV Moudule data";
//   Real Ul0 = pvField.pvModuleData.Ul0
//   "get open circuit voltage from PV Module data";
equation
//   if sz[1] < 1 then pvField.pvModuleData.UI=[0,Ik0;Ul0,0];
//   else pvField.pvModuleData.UI=pvField.pvModuleData.UI;
//   end if;

  connect(pvField.TAmb, from_degC.y) annotation (Line(
      points={{-44,52},{-44,72},{-51.6,72}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(constTemp.y, from_degC.u) annotation (Line(points={{-67.6,72},{-60.8,
          72}},            color={0,0,127}));
  connect(pvField.radiationPort, constRadiation.radiationPort) annotation (Line(
        points={{-46,52},{-46,52},{-46,60},{-67.2,60}}, color={244,125,35}));
  connect(increasVoltage.y, pvField.UField) annotation (Line(points={{-32.4,50},
          {-32.4,50},{-40,50}}, color={0,0,127}));
  connect(Idiff_sq.u1, ISum.y) annotation (Line(points={{-45.6,29.2},{-44,29.2},
          {-44,28},{-42.34,28}}, color={0,0,127}));
  connect(Idiff_sq.u2, ISum.y) annotation (Line(points={{-45.6,26.8},{-44,26.8},
          {-44,28},{-42.34,28}}, color={0,0,127}));
  connect(pvField.IField, ISum.u[1]) annotation (Line(points={{-40,48},{-36,48},
          {-36,28.7},{-38,28.7}}, color={0,0,127}));
  connect(IVcurve_reference.y, ISum.u[2]) annotation (Line(points={{-32.4,22},{
          -36,22},{-36,27.3},{-38,27.3}}, color={0,0,127}));
  connect(Idiff_sq.y, Idiff_sum.u)
    annotation (Line(points={{-50.2,28},{-51.6,28}}, color={0,0,127}));
  connect(Idiff_sum.y, sqrt1.u)
    annotation (Line(points={{-56.2,28},{-57.6,28}}, color={0,0,127}));
  connect(sqrt1.y, genOptInterface.costFunction) annotation (Line(points={{
          -62.2,28},{-68,28},{-68,25.2}}, color={0,0,127}));
    annotation (Placement(transformation(extent={{-20,68},{-28,76}})),
             Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,0},{-20,100}}), graphics={
    Text(extent={{-60,8},{-60,4}},  lineColor={0,0,255},fontSize=22,
          textString="Model to run with GenOpt to calculate
optimized PV module parameters.")}),
    experiment(StopTime=22.76),
    __Dymola_Commands(file="Resources/Scripts/Dymola/Photovoltaics/PVModuleParameterOpt.mos"
        "Simulate and plot"),
Documentation(info="<html>
<p>This example tests uses the IV curve generator example <a href=\"modelica://BuildingSystems.Technologies.Photovoltaics.PVModuleComplex\">BuildingSystems.Technologies.Photovoltaics.</a><a href=\"modelica://BuildingSystems.Technologies.Photovoltaics.IVCurveGeneration\">PVModuleComplex</a> to create a model which can be used with <a href=\"https://simulationresearch.lbl.gov/GO/\">GenOpt</a> to calibrate the characteristic PV module factors c1, c2, cs1, cs2, RSer, and RPar. </p>
<h4>Instructions</h4>
<ol>
<li>Insert recorded reference curve to <a href=\"modelica://
BuildingSystems.Technologies.Photovoltaics.Data.PhotovoltaicIVCurves\">BuildingSystems.Technologies.Photovoltaics.Data.PhotovoltaicIVCurves</a><br><i>Hint: extend the number of base points at the increased slope around MPP</i></li>
<li>Select recorded reference curve within the code (line 11)</li>
<li>Use<i> Commands -&gt; Simulate and plot</i> to generate dymosim.exe.<br>Note that the working directory will be switched to <a href=\"modelica://SPACS_Matrix/Resources/GenOpt/PVParameterOptimization/\">SPACS_Matrix/Resources/GenOpt/PVParameterOptimization</a></li>
<li>Review the difference between reference curve and simulated curve in the simulation tab.<br>Vary the parameters c1, c2, cs1, cs2, RPar, and RSer and run <i>Simulate and plot</i> again.<br>Try to manually approach the reference curve.<br><i>Hint: you can review the GenOpt interface inpute to review the deviation between both curves. A deviation below 10 should be achieved for a successfull parameter optimization.</i></li>
<li>Review the <a href=\"modelica://SPACS_Matrix/Resources/GenOpt/PVParameterOptimization/dsin.txt\">dsin.txt</a> file within the new working directory.<br>Locate the table &quot;double initialValue&quot; and exchange the values for c1, c2, cs1, cs2, RSer, and RPar with &percnt;c1&percnt;, &percnt;c2&percnt;, &percnt;cs1&percnt;, &percnt;cs2&percnt;, &percnt;RSer&percnt;, and &percnt;RPar&percnt;.</li>
<p>Save the file as &quot;dsinTemplate.txt&quot;.</p>
<p><img src=\"modelica://SPACS_Matrix/Resources/Images/Utilities/GenOpt_dsintxt.png\"/></p>
<li>Open <a href=\"modelica://SPACS_Matrix/Resources/GenOpt/PVParameterOptimization/command.txt\">command.txt</a> and exchange the initial parameter (Ini) of each variable to the ones which you gained in step 4.<br>Review the upper and lower boundary and step size for each parameter (Min, Max, Step).<br><i>Hint: the step size should be choosen around Step = Ini * 10E-2.</i></li>
<li>Open GenOpt and locate <a href=\"modelica://SPACS_Matrix/Resources/GenOpt/PVParameterOptimization/optWinXP.ini\">optWinXP.ini</a> within the working directory.</li>
<li>The optimized paramter can be found at the end of in the OutputListingMain.txt</li>
</ol>
</html>", revisions="<html>
</html>"));
end IVCurveParameterOptimization;
