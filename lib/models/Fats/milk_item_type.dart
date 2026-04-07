class MilksnEggItemType {
  // I don't know how to name this class, maybe in the future I will rewrite it.
  final String title;
  final double water;
  final double totalSolids;
  final double fat;
  final double milkSolidsNotFat;
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
  ///Suggestion:
  ///// Sum of total solids (EST)
  /* double get totalSolids => fat + msnf;

  // Calculation of the sweetening power (POD) provided by the lactose of the MSNF
  // We take ~50% of the MSNF multiplied by the POD of lactose (0.16)
  double get pointOfOverrun => (msnf * 0.5) * 0.16; */
}
