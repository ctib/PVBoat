within SPACS_Matrix.Buildings.Data.Constructions;
package Opaque
extends Modelica.Icons.Package;
  record BasePlateMultistoreyEgypt =
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction (
    final nLayers=2,
    thickness={0.75,0.015},
    material={HAM.Data.MaterialProperties.Thermal.ConcreteEgyptian(),
              HAM.Data.MaterialProperties.Thermal.Masea.LimeSandStone()})
    "Base plate construction for typical egyptian multistorey building (based on S.Attia, 2012)";
  record IntermediateCeilingEgypt =
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction (
    final nLayers=3,
    thickness={0.01,0.17,0.02},
    material={HAM.Data.MaterialProperties.Thermal.Masea.LimePlaster(),
              HAM.Data.MaterialProperties.Thermal.ConcreteEgyptian(),
              HAM.Data.MaterialProperties.Thermal.Masea.LimeSandStone()})
    "Intermediate ceiling construction for an egyptian building";
  record IntermediateWallMultistoreyEgypt =
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction (
    final nLayers=3,
    thickness={0.026,0.22,0.026},
    material={HAM.Data.MaterialProperties.Thermal.Masea.LimePlaster(),
              HAM.Data.MaterialProperties.Thermal.BrickEgyptian(),
              HAM.Data.MaterialProperties.Thermal.Masea.LimePlaster()})
    "Intermediate wall construction for typical egyptian multistorey (based on S.Attia, 2012)";
  record OuterWallMultistoreyEgypt =
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction (
    final nLayers=3,
    thickness={0.01,0.22,0.01},
    material={HAM.Data.MaterialProperties.Thermal.Masea.LimePlaster(),
              HAM.Data.MaterialProperties.Thermal.BrickEgyptian(),
              HAM.Data.MaterialProperties.Thermal.Masea.LimePlaster()})
    "Outer wall construction for a typical egyptian multistorey building (based on S. Attia, 2012)";
  record RoofMultistoreyEgypt =
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction (
    final nLayers=3,
    thickness={0.01,0.24,0.01},
    material={HAM.Data.MaterialProperties.Thermal.Masea.LimePlaster(),
              HAM.Data.MaterialProperties.Thermal.ConcreteEgyptian(),
              HAM.Data.MaterialProperties.Thermal.Masea.LimeSandStone()})
    "Roof construction for typical egyptian multistorey building  (based on S.Attia, 2012)";
end Opaque;
