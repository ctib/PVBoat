within SPACS_Matrix.Buildings;
model RualResidentialBuilding
  extends BuildingSystems.Buildings.BuildingTemplates.Building1Zone1DBox(
    calcIdealLoads=false,
    heatSources = true,
    nHeatSources = 1,
    heightWindow1=5.23,
    heightWindow2=5.10,
    heightWindow3=5.23,
    heightWindow4=5.10,
    widthWindow1=5.23,
    widthWindow2=5.10,
    widthWindow3=5.23,
    widthWindow4=5.10,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallRowhouse1918 constructionWall1,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallRowhouse1918 constructionWall2,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallRowhouse1918 constructionWall3,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallRowhouse1918 constructionWall4,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.RoofRowhouse1918 constructionCeiling,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.BasePlateRowhouse1918 constructionBottom,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.IntermediateWallRowhouse1918 constructionWallsInterior,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.IntermediateCeilingRowhouse1918 constructionCeilingsInterior,
    width=16.44,
    length=17.29,
    height=11.16,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionWindow1,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionWindow2,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionWindow3,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionWindow4);
end RualResidentialBuilding;