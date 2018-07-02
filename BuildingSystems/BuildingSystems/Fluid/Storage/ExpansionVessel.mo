within BuildingSystems.Fluid.Storage;
model ExpansionVessel "Expansion vessel with fixed pressure"
 extends BuildingSystems.Fluid.Interfaces.LumpedVolumeDeclarations(
   final energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
   final massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
   final mSenFac=1);
 parameter Modelica.SIunits.Volume V_start(start=1)
    "Volume of liquid stored in the vessel at the start of the simulation";
 parameter Modelica.SIunits.Pressure p = Medium.p_default
    "Constant pressure of the expansion vessel";

  Modelica.Fluid.Interfaces.FluidPort_a port_a(
    redeclare package Medium = Medium) "Fluid port"
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  Modelica.SIunits.Mass m "Mass of liquid in the vessel";

protected
  final parameter Medium.ThermodynamicState state_start = Medium.setState_pTX(
      T=T_start,
      p=p_start,
      X=X_start[1:Medium.nXi]) "Medium state at start values";
  final parameter Modelica.SIunits.Density rho_start=Medium.density(
   state=state_start) "Density, used to compute start and guess values";

  Modelica.SIunits.Energy H "Internal energy of fluid";
  Modelica.SIunits.Mass[Medium.nXi] mXi
    "Masses of independent components in the fluid";
  Modelica.SIunits.Mass[Medium.nC] mC "Masses of trace substances in the fluid";
  Medium.ExtraProperty C[Medium.nC](nominal=C_nominal)
    "Trace substance mixture content";

initial equation
  m = V_start * rho_start;
  H = m*Medium.specificInternalEnergy(
          Medium.setState_pTX(p=p_start, T=T_start, X= X_start[1:Medium.nXi]));
  mXi = m*X_start[1:Medium.nXi];
  mC = m*C_start[1:Medium.nC];
equation
  assert(m > 1.0E-8,
    "Expansion vessel is undersized. You need to increase the value of the parameter V_start.");
  // Conservation equations
  der(m)   = port_a.m_flow;
  der(H)   = port_a.m_flow * actualStream(port_a.h_outflow);
  der(mXi) = port_a.m_flow * actualStream(port_a.Xi_outflow);
  der(mC)  = port_a.m_flow * actualStream(port_a.C_outflow);
  // Properties of outgoing flow.
  // The port pressure is set to a constant value.
  port_a.p          = p_start;
  m*port_a.h_outflow  = H;
  m*port_a.Xi_outflow = mXi;
  m*port_a.C_outflow  = mC;

   annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,
            -100},{100,100}}), graphics={
        Text(
          extent={{-148,98},{152,138}},
          textString="%name",
          lineColor={0,0,255}),
        Rectangle(
          extent={{-80,80},{80,-80}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-68,70},{70,-70}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-68,18},{-68,18},{-54,32},{-28,16},{0,30},{26,16},{46,32},{
              70,18},{70,18},{70,-70},{70,-70},{-68,-70},{-68,-70},{-68,18}},
          lineColor={0,0,255},
          smooth=Smooth.Bezier,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{2,-80},{-2,-90}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,127},
          fillPattern=FillPattern.Solid)}),
defaultComponentName="exp",
Documentation(info="<html>
<p>
This is a model of a pressure expansion vessel. The vessel has a constant pressure
that is equal to the value of the parameter <code>p_start</code>.
The model takes into account the energy and mass balance of the medium.
It has no heat exchange with the ambient.
</p>
<p>
The expansion vessel needs to be used in closed loops that contain
water to set a reference pressure and, for liquids where the
density is modeled as a function of temperature, to allow for
the thermal expansion of the liquid.
</p>
<p>
Note that alternatively, the model
<a href=\"modelica://BuildingSystems.Fluid.Sources.FixedBoundary\">
BuildingSystems.Fluid.Sources.FixedBoundary</a> may be used to set
a reference pressure. The main difference between these two models
is that in this model, there is an energy and mass balance for the volume.
In contrast, for
<a href=\"modelica://BuildingSystems.Fluid.Sources.FixedBoundary\">
BuildingSystems.Fluid.Sources.FixedBoundary</a>,
any mass flow rate that flows out of the model will be at a user-specified temperature.
Therefore, <a href=\"modelica://BuildingSystems.Fluid.Sources.FixedBoundary\">
BuildingSystems.Fluid.Sources.FixedBoundary</a> leads to smaller systems
of equations, which may result in faster simulation.
</p>
</html>", revisions="<html>
<ul>
<li>
May 29, 2014, by Michael Wetter:<br/>
Removed undesirable annotation <code>Evaluate=true</code>.
</li>
<li>
March 25, 2014 by Michael Wetter:<br/>
Revised the model to use a constant pressure rather than a constant volume of
water and gas. This leads to a simpler model.
</li>
<li>
August 1, 2013 by Michael Wetter:<br/>
Updated model to use new connector <code>mWat_flow</code>.
</li>
<li>
February 7, 2012 by Michael Wetter:<br/>
Revised due to changes in conservation equations in <code>BuildingSystems.Fluid.Interfaces</code>.
</li>
<li>
September 16, 2011 by Michael Wetter:<br/>
Set <code>m(stateSelect=StateSelect.always)</code>, since
setting the <code>stateSelect</code> attribute leads to smaller systems of equations.
</li>
<li>
July 26, 2011 by Michael Wetter:<br/>
Revised model to use new declarations from
<a href=\"BuildingSystems.Fluid.Interfaces.LumpedVolumeDeclarations\">
BuildingSystems.Fluid.Interfaces.LumpedVolumeDeclarations</a>.
</li>
<li>
May 25, 2011 by Michael Wetter:<br/>
Revised model due to a change in the fluid volume model.
</li>
<li>
Nov. 4, 2009 by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"));
end ExpansionVessel;