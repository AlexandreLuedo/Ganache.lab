class Recipe {
  final String id;
  final String title;
  final DateTime createdAt;
  
  // Ingredients
  final double chocolateWeight;
  final double milkChocolateWeight;
  final double creamWeight;
  final double sugarWeight;
  final double butterWeight;
  final String chocolateType;

  // Parameters (Summary)
  final String application;
  final double temperature;

  // Calculated Results
  final double totalWeight;
  final double waterPercentage;
  final double fatPercentage;
  final double sugarPercentage;
  final double solidsPercentage;
  final double sweeteningPower;
  final double awValue;

  Recipe({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.chocolateWeight,
    required this.milkChocolateWeight,
    required this.creamWeight,
    required this.sugarWeight,
    required this.butterWeight,
    required this.chocolateType,
    required this.application,
    required this.temperature,
    required this.totalWeight,
    required this.waterPercentage,
    required this.fatPercentage,
    required this.sugarPercentage,
    required this.solidsPercentage,
    required this.sweeteningPower,
    required this.awValue,
  });
}
