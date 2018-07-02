within SPACS_Matrix.HAM.Data.MaterialProperties.Thermal;
record ConcreteEgyptian =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=2,
    name="Concrete (Beton)",
    lambda=0.46,
    c=880,
    rho=2300) "Concrete (Egyptian standard)"
                                 annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
