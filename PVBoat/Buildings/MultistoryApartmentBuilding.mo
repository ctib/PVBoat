within SPACS_Matrix.Buildings;
model MultistoryApartmentBuilding
  extends BuildingSystems.Buildings.BuildingTemplates.Building1Zone1DBox(
    calcIdealLoads=false,
    heatSources = true,
    nHeatSources = 1,
    height=32.4,
    redeclare Data.Constructions.Opaque.OuterWallMultistoreyEgypt
      constructionWall1,
    redeclare Data.Constructions.Opaque.OuterWallMultistoreyEgypt
      constructionWall2,
    redeclare Data.Constructions.Opaque.OuterWallMultistoreyEgypt
      constructionWall3,
    redeclare Data.Constructions.Opaque.OuterWallMultistoreyEgypt
      constructionWall4,
    redeclare Data.Constructions.Opaque.RoofMultistoreyEgypt
      constructionCeiling,
    redeclare Data.Constructions.Opaque.BasePlateMultistoreyEgypt
      constructionBottom,
    redeclare Data.Constructions.Opaque.IntermediateWallMultistoreyEgypt
      constructionWallsInterior,
    redeclare Data.Constructions.Opaque.IntermediateCeilingEgypt
      constructionCeilingsInterior,
    widthWindow1=11.9,
    heightWindow1=18,
    redeclare Buildings.Data.Constructions.Transparent.SingleGlazingEgypt
      constructionWindow1,
    widthWindow2=6.8,
    heightWindow2=18,
    redeclare Buildings.Data.Constructions.Transparent.SingleGlazingEgypt
      constructionWindow2,
    widthWindow3=11.9,
    heightWindow3=18,
    redeclare Buildings.Data.Constructions.Transparent.SingleGlazingEgypt
      constructionWindow3,
    widthWindow4=6.8,
    heightWindow4=28,
    redeclare Buildings.Data.Constructions.Transparent.SingleGlazingEgypt
      constructionWindow4,
    width=29.08,
    length=17.52);
end MultistoryApartmentBuilding;
