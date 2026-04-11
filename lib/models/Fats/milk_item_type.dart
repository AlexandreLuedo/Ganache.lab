import 'package:ganache_lab/services/calculation.dart';

class MilksnEggItemType implements Ingredient {
  final String title;
  final double water;
  final double totalSolids;
  final double fat;
  final double diaryFat;
  final double milkSolidsNotFat;
  final double litterWeight;

  MilksnEggItemType({
    required this.title,
    required this.water,
    required this.totalSolids,
    required this.fat,
    required this.diaryFat,
    required this.milkSolidsNotFat,
    this.litterWeight = 1000,
  });

  @override
  String get name => title;

  @override
  double get waterContent => water;

  @override
  double get fatContent => fat;

  @override
  double get sugarContent => (milkSolidsNotFat * 0.5) * 0.16; // Lactose's POD (Pouvoir Sucrant)

  @override
  double get solidsContent => totalSolids;
}
