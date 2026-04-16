import 'package:ganache_lab/services/calculation.dart';

class SugarTypeItem implements Ingredient {
  final String title;
  final double saccharoseRule = 0.15;
  final double glucoseRuleMin = 0.05;
  final double glucoseRuleMax = 0.1;
  final double sorbitolRuleMax = 0.05;
  final double totalSolids; // EST (Extrait sec total)
  final double pointOfOverrun; // PS (Pouvoir Sucrant)
  final double molarWeight; // MW (Poids molaire en g/mol)

  SugarTypeItem({
    required this.title,
    required this.totalSolids,
    required this.pointOfOverrun,
    required this.molarWeight,
  });

  @override
  String get name => title;

  @override
  double get waterContent => 1.0 - totalSolids;

  @override
  double get fatContent => 0.0; // Sugars usually have no fat

  @override
  double get sugarContent => pointOfOverrun;

  @override
  double get solidsContent => totalSolids;
}
