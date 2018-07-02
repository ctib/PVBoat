within PVBoat.ElectricalStorages.Data;
package LeadAcid "Data base with parameter sets of lead acid batteries"
  record Long7Ah =
      SPACS_Matrix.ElectricalStorages.Data.BaseClasses.ElectricBatteryGeneral (
    E_nominal = 86.4*3600,
    U_nominal = 12.0,
    SOC_min = 0.01,
    c = 0.315,
    k = 1.24/3600,
    etaCharge = 0.92736,
    etaLoad = 0.92736,
    fDis = 0.2/182.5/24.0/3600.0,
    PLoad_max = 1296.0,
    PCharge_max = 25.9,
    R_int = 22/1000,
    p = 1.08,
    a_mcr = 0.96/3600,
    A = -0.125,
    C = -0.05)
    "Lead acid battery 'WP7.2-12' by Long: 86.4 Wh (7.2Ah at 12V)"
    annotation(Documentation(info= "<html>Source: Datasheet for Long WP7.2-12, https://www.kunglong.com/product_pdf/en/WP7.2-12.pdf<br/></html>"));
end LeadAcid;
