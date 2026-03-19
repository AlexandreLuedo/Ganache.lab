class MilksnEggItemType {
  // I don't know how to name this class, maybe in the future I will rewrite it.
  final String title;
  final double water;
  final double totalSolids; // EST - Extrait sec total
  final double fat;
  final double milkSolidsNotFat; // ESDL - Extrait Sec dégraissé du lait
  final double litterWeight;

  MilksnEggItemType({
    required this.title,
    required this.water,
    required this.totalSolids,
    required this.fat,
    required this.milkSolidsNotFat,
    required this.litterWeight,
  });

  double get pointOfOverum => (milkSolidsNotFat / 2 * 0.16);

  ///DOC
  ///Sugggestion :
  ///// Somme des matières sèches (EST)
  /* double get totalSolids => fat + msnf;

  // Calcul du pouvoir sucrant (POD) apporté par le lactose de l'ESDL
  // On prend ~50% de l'ESDL multiplié par le POD du lactose (0.16)
  double get pointOfOverrun => (msnf * 0.5) * 0.16; */
}
