within SPACS_Matrix.HAM.Data.MaterialProperties.Thermal.Masea;
record HollowBrick =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=6,
    name="Perforrated hollow brick (Hochlochziegel)",
    lambda=0.18,
    c=850,
    rho=765) "Perforrated hollow brick (Hochlochziegel)"
    annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
