within SPACS_Matrix.Buildings;
model SingleApartment_older
  extends BuildingSystems.Buildings.BuildingTemplates.Building1Zone1DBox(
    calcIdealLoads=false,
    heatSources = true,
    nHeatSources = 1,
    height=3,
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
    widthWindow1=1.2,
    heightWindow1=2,
    redeclare Buildings.Data.Constructions.Transparent.SingleGlazingEgypt constructionWindow1,
    redeclare Buildings.Data.Constructions.Transparent.SingleGlazingEgypt constructionWindow2,
    redeclare Buildings.Data.Constructions.Transparent.SingleGlazingEgypt constructionWindow3,
    redeclare Buildings.Data.Constructions.Transparent.SingleGlazingEgypt constructionWindow4,
    width=4.0,
    length=6.0);
end SingleApartment_older;
