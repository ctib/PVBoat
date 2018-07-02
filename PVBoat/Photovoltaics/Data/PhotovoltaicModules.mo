within PVBoat.Photovoltaics.Data;
package PhotovoltaicModules
  "Data base with photovoltaic module types"
  record DataSetPhotovoltaicModule
    parameter Real c1(unit = "m2/V")
      "1st coefficient IPho";
    parameter Real c2(unit = "m2/(kV.K)")
      "2nd coefficient IPho";
    parameter Real cs1(unit = "A/K3")
      "1st coefficient ISat1";
    parameter Real cs2(unit = "A/(K5)")
      "2nd coefficient ISat2";
    parameter Real Eg(unit = "eV")
      "Band gap";
    parameter Modelica.SIunits.Length height
      "PV module height";
    parameter Modelica.SIunits.ElectricCurrent Ik0
      "Short circuit current under standard conditions";
    parameter Integer nCelSer
      "Number of serial connected cells within the PV module";
    parameter Integer nCelPar
      "Number of parallel connected cells within the PV module";
    parameter Modelica.SIunits.Power PEl_nominal
      "Module power under standard conditions";
    parameter Modelica.SIunits.Resistance RSer
      "Serial resistance";
    parameter Modelica.SIunits.Resistance RPar
      "Parallel resistance";
    parameter Real tIk0
      "Temperature coefficient for the short circuit current in mA/C";
    parameter Real tUl0
      "Temperature coefficient for the open circuit voltage in V/C";
    parameter Modelica.SIunits.Voltage Ul0
      "Open circuit voltage under standard conditions";
    parameter Modelica.SIunits.Length width
      "Module width";

    //Data for parameter optimization
    parameter Modelica.SIunits.Temp_K TCel(start = 25)
      "Cell temperature during measurement, default = 25°C (STC)";
    parameter Real ITot( unit = "W/m2", start = 1000)
      "Effective total solar irradiation on solar cell, default 1000W/m2 (STC)";
    parameter Modelica.SIunits.Current UI[:,2]
      "Discrete voltage values of the characteristic curve, from 0 to U10 and corresponding current";

  end DataSetPhotovoltaicModule;
  /* Parameter Spectra Volt 100M36S */
  record SpectraVolt100M36S =   DataSetPhotovoltaicModule (
    PEl_nominal =  100.0,
    RPar = 935.8011,
    RSer = 0.006629844,
    c1 = 0.005493984,
    c2 = 0.00033398822,
    cs1 = 1.4269971,
    cs2 = 0.000504,
    nCelSer = 36,
    nCelPar = 1,
    height = 1.195,
    width = 0.545,
    Ik0 = 5.9,
    Ul0 = 22.74,
    tIk0 = 1.659,
    tUl0 = -0.060,
    Eg = 1.107,
    TCel = 25.0,
    ITot = 1000.0,
    UI = [0,5.62;
          0.1,5.62;
          5,5.61;
          10,5.6;
          15,5.58;
          15.4,5.57;
          15.8,5.56;
          16.2,5.55;
          16.6,5.52;
          17,5.49;
          17.4,5.45;
          17.8,5.38;
          18.2,5.3;
          18.6,5.18;
          19,5.02;
          19.4,4.81;
          19.8,4.54;
          20.2,4.18;
          20.6,3.76;
          21,3.24;
          21.4,2.63;
          21.8,1.94;
          22.2,1.16;
          22.6,0.3;
          22.73,0]);

end PhotovoltaicModules;
