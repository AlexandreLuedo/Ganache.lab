import 'package:ganache_lab/services/calculation.dart';

class ChocolateTypeItem implements Ingredient {
  final String type;
  final bool isFramed;
  final bool isMolded;
  final double cocoaButter;
  final double moldedMin;
  final double moldedMax;

  ChocolateTypeItem({
    required this.type,
    required this.isFramed,
    required this.isMolded,
    required this.cocoaButter,
    this.moldedMin = 0.12,
    this.moldedMax = 0.18,
  });

  String get title => "$type Chocolate";

  double get moldedMedian => (moldedMin + moldedMax) / 2;

  @override
  String get name => title;

  @override
  double get waterContent => 0.0; // Chocolate has almost no water

  @override
  double get fatContent => cocoaButter;

  @override
  double get sugarContent => 1.0 - cocoaButter; // Approximation: the rest is sugar/solids

  @override
  double get solidsContent => 1.0; // Chocolate is 100% solids
}
