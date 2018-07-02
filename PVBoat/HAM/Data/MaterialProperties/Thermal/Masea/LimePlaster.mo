within SPACS_Matrix.HAM.Data.MaterialProperties.Thermal.Masea;
record LimePlaster =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=7,
    name="Gypsum-lime plaster (Kalkputz)",
    lambda=0.7,
    c=850.0,
    rho=1600) "Gypsum-lime plaster (Kalkputz)"
    annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
