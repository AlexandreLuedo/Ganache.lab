import 'package:flutter/material.dart';
import 'package:ganache_lab/models/notifiers/chocolate_type_notifier.dart';
import 'package:ganache_lab/models/notifiers/weight_ganache_notifier.dart';
import 'package:ganache_lab/widgets/ganache_type_selection.dart';

abstract class Ingredient {
  String get name;
  double get waterContent; // % (0.0 to 1.0)
  double get fatContent; // % (0.0 to 1.0)
  double get sugarContent; // % (0.0 to 1.0) - Pouvoir Sucrant
  double get solidsContent; // % (0.0 to 1.0) - Extrait Sec Total
}

class RecipeIngredient {
  final Ingredient ingredient;
  double weight;

  RecipeIngredient({required this.ingredient, this.weight = 0.0});

  double get waterWeight => weight * ingredient.waterContent;
  double get fatWeight => weight * ingredient.fatContent;
  double get sugarWeight => weight * ingredient.sugarContent;
  double get solidsWeight => weight * ingredient.solidsContent;
}

class RecipeNotifier extends ChangeNotifier {
  final List<RecipeIngredient> _ingredients = [];

  List<RecipeIngredient> get ingredients => List.unmodifiable(_ingredients);

  void addIngredient(Ingredient ingredient, {double weight = 0.0}) {
    _ingredients.add(RecipeIngredient(ingredient: ingredient, weight: weight));
    notifyListeners();
  }

  void removeIngredient(int index) {
    _ingredients.removeAt(index);
    notifyListeners();
  }

  void updateWeight(int index, double weight) {
    _ingredients[index].weight = weight;
    notifyListeners();
  }

  double get totalWeight =>
      _ingredients.fold(0, (sum, item) => sum + item.weight);
  double get totalWater =>
      _ingredients.fold(0, (sum, item) => sum + item.waterWeight);
  double get totalFat =>
      _ingredients.fold(0, (sum, item) => sum + item.fatWeight);
  double get totalSugar =>
      _ingredients.fold(0, (sum, item) => sum + item.sugarWeight);
  double get totalSolids =>
      _ingredients.fold(0, (sum, item) => sum + item.solidsWeight);

  double get fatPercentage => totalWeight == 0 ? 0 : (totalFat / totalWeight);
  double get sugarPercentage => totalWeight == 0 ? 0 : (totalSugar / totalWeight);
  double get solidsPercentage =>
      totalWeight == 0 ? 0 : (totalSolids / totalWeight);
  double get waterPercentage => totalWeight == 0 ? 0 : (totalWater / totalWeight);
}

class TotalModel extends ChangeNotifier {
  double total = 0.0;
  
  double chocolateWeight = 0.0;
  double creamWeight = 0.0;
  double sugarWeight = 0.0;
  double butterWeight = 0.0;

  void calculateTotal(
    FrameModel frame,
    MoldModel mold,
    OtherModel other,
    ApplicationModel app,
    ChocolateTypeModel chocolateTypeNotifier,
  ) {
    switch (app.currentView) {
      case Application.moulage:
        total = mold.moldResult.toDouble();
        break;
      case Application.cadrage:
        total = frame.frameResult;
        break;
      case Application.autre:
        total = other.otherWeight.toDouble();
        break;
    }

    double recommendedSugar = 0.275; // Recommended 25 at 30% -> 27.5%
    double recommendedButter = 0.10; // Recommended 5 at 15% -> 10%

    // User's chocolate type provides cocoa butter content (e.g., 0.18, 0.22).
    // We assume an average chocolate cocoa butter content if not provided by user directly.
    double cocoaButterChocolate = chocolateTypeNotifier.cocoaButterType; 
    
    // Estimate sugar in chocolate: 1.0 - cocoaButter - nonFatCocoaSolids (~10-15%)
    // Let's use a simpler heuristic for MVP:
    double sugarChocolate = (1.0 - cocoaButterChocolate) * 0.8; 

    // Target cocoa butter in final ganache (around 12-15%)
    double targetCocoaButter = 0.15;
    
    // Calculate required chocolate weight to hit target cocoa butter
    if (cocoaButterChocolate > 0) {
      chocolateWeight = (total * targetCocoaButter) / cocoaButterChocolate;
    } else {
      chocolateWeight = total * 0.45; // Fallback
    }

    if (chocolateWeight > total * 0.7) {
      chocolateWeight = total * 0.7; // Cap chocolate to 70% max
    }

    // Determine the needed sugar weight
    double targetSugar = total * recommendedSugar;
    double sugarFromChocolate = chocolateWeight * sugarChocolate;
    
    if (targetSugar > sugarFromChocolate) {
      sugarWeight = targetSugar - sugarFromChocolate;
    } else {
      sugarWeight = sugarFromChocolate - targetSugar;
    }

    // Determine the needed fats
    butterWeight = total * recommendedButter;

    // Deduct the cream
    creamWeight = total - (chocolateWeight + sugarWeight + butterWeight);
    if (creamWeight < 0) creamWeight = 0; // Safety fallback

    notifyListeners();
  }
}

/// The analytic table
/// This class will take the ganache informations and will output values
/*
class Calculation {
  /// DOC
  /// This class work in two steps (getIngredientComposition, validationRules)
  /// getIngredientComposition will fill all "totalvars" with all ingredient composition.
  /// validationRules will takes all "totalvars" for analysing them and provide statistic on the user screen.
  double totalWeight = 0.0;
  double totalWater = 0.0;
  double totalFat = 0.0;
  double totalDiaryFat = 0.0;
  double totalCocoaFat = 0.0;
  double totalSugar = 0.0;

  double totalSolids = 0.0;

  double ingredientLists = 0.0;
  String ingredientType = "";

  void getIngredientComposition(
    totalWeight,
    totalWater,
    totalFat,
    totalDiaryFat,
    totalCocoaFat,
    totalSugar,

    totalSolids,
    ingredientLists,
    ingredientType,
  ) {
    /// This loop passes all the ingredients and get theirs composition.
    for (var ingredients in ingredientLists) {
      totalWeight =
          totalWeight * Ingredients.weight; // Bro must be declared in a class

      totalWater = totalWater + (Ingredients.weight * Ingredient.water);
      totalFat = totalFat + (Ingredients.weight * Ingredient.fat);
      totalDiaryFat =
          totalDiaryFat + (Ingredients.weight * Ingredient.diaryFat);
      totalCocoaFat =
          totalCocoaFat + (Ingredients.weight * Ingredient.cocoaFat);
      totalSugar = totalSugar + (Ingredients.weight * Ingredient.totalSugar);

      totalSolids = totalSolids + (Ingredients.weight * Ingredient.water);
      totalWater = totalWater + (Ingredients.weight * Ingredient.water);
    }
  }

  validationRules(
    totalWeight,
    totalWater,
    totalFat,
    totalDiaryFat,
    totalCocoaFat,
    totalSugar,

    totalSolids,
    ingredientLists,
    ingredientType,
  ) {
    // if 
  }
}

abstract class IngredientBase {
  String get name;
  String get ingredientType;
  double get weight;
  double get waterPercentage;
  double get fatPercentage;
  double get totalSolidsPercentage;
}
*/