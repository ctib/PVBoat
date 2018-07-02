within SPACS_Matrix.HAM.Data.MaterialProperties.Thermal;
record BrickEgyptian =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=1,
    name="Brick (Egyptian standard)",
    lambda=0.58,
    c=840,
    rho=1500) "Brick (Egyptian standard)"
                                      annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
