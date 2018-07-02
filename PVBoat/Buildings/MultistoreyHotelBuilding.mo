within SPACS_Matrix.Buildings;
model MultistoreyHotelBuilding
  extends BuildingSystems.Buildings.BuildingTemplates.Building1Zone1DBox(
    calcIdealLoads=false,
    heatSources = true,
    nHeatSources = 1,
    heightWindow1=33.17,
    heightWindow2=33.03,
    heightWindow3=33.17,
    heightWindow4=33.03,
    widthWindow1=14.74,
    widthWindow2=14.68,
    widthWindow3=14.74,
    widthWindow4=14.68,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallMultistorey1958to1968 constructionWall1,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallMultistorey1958to1968 constructionWall2,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallMultistorey1958to1968 constructionWall3,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallMultistorey1958to1968 constructionWall4,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.RoofMultistorey1958to1968 constructionCeiling,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.BasePlateMultistorey1958to1968 constructionBottom,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.IntermediateWallMultistorey1958to1968 constructionWallsInterior,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.IntermediateCeilingMultistorey1958to1968 constructionCeilingsInterior,
    width=22.31,
    length=22.5,
    height=62.26,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionWindow1,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionWindow2,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionWindow3,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionWindow4);
end MultistoreyHotelBuilding;
