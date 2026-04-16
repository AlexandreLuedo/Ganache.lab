import 'package:flutter/material.dart';
import 'package:ganache_lab/data/chocolates_data.dart';
import 'package:ganache_lab/models/notifiers/chocolate_type_notifier.dart';
import 'package:ganache_lab/models/notifiers/weight_ganache_notifier.dart';
import 'package:ganache_lab/widgets/ganache_type_selection.dart';

abstract class Ingredient {
  String get name;
  double get waterContent;
  double get fatContent;
  double get sugarContent;
  double get solidsContent;
}

class TotalModel extends ChangeNotifier {
  double total = 0.0;
  
  // Recipe Weights (g)
  double chocolateWeight = 0.0;     // Total chocolate or Dark part
  double milkChocolateWeight = 0.0; // Milk chocolate part (if blend)
  double creamWeight = 0.0;
  double sugarWeight = 0.0;
  double butterWeight = 0.0;

  // Analytical Columns (g) - Following your pro spreadsheet
  double waterWeight = 0.0;
  double cocoaButterWeight = 0.0;
  double defattedCocoaWeight = 0.0;
  double milkFatWeight = 0.0;
  double totalFatWeight = 0.0;
  double totalSugarWeight = 0.0;
  double totalPODWeight = 0.0;
  double totalSolidsWeight = 0.0;

  // Final Percentages (%)
  double waterPercentage = 0.0;
  double cocoaButterPercentage = 0.0;
  double sugarPercentage = 0.0;
  double solidsPercentage = 0.0;
  double totalFatPercentage = 0.0;
  double sweeteningPower = 0.0; // POD
  double awValue = 0.85;

  void reset() {
    total = 0.0;
    chocolateWeight = 0.0;
    milkChocolateWeight = 0.0;
    creamWeight = 0.0;
    sugarWeight = 0.0;
    butterWeight = 0.0;
    waterWeight = 0.0;
    cocoaButterWeight = 0.0;
    defattedCocoaWeight = 0.0;
    milkFatWeight = 0.0;
    totalFatWeight = 0.0;
    totalSugarWeight = 0.0;
    totalPODWeight = 0.0;
    totalSolidsWeight = 0.0;
    waterPercentage = 0.0;
    cocoaButterPercentage = 0.0;
    sugarPercentage = 0.0;
    solidsPercentage = 0.0;
    totalFatPercentage = 0.0;
    sweeteningPower = 0.0;
    awValue = 0.85;
    notifyListeners();
  }

  void calculateTotal(
    FrameModel frame,
    MoldModel mold,
    OtherModel other,
    ApplicationModel app,
    ChocolateTypeModel chocolateTypeNotifier,
  ) {
    // 1. Determine Target Total Weight
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

    if (total <= 0) return;

    // 2. Define Reference Chocolates (based on your example)
    // Dark: Caraïbe 66% (40.5% BC, 25.5% solids, 32% sugar)
    final darkChoc = const Chocolate(
      brand: "Valrhona",
      name: "Caraïbe 66%",
      cocoaButter: 0.405,
      nonFatCocoaSolids: 0.255,
      totalFat: 0.405,
      sugar: 0.32,
    );

    // Milk: Bahibé 46% (28.4% BC, 17.6% solids, 30% sugar, 6% milk fat, 15% lactose)
    final milkChoc = const Chocolate(
      brand: "Valrhona",
      name: "Bahibé 46%",
      cocoaButter: 0.284,
      nonFatCocoaSolids: 0.176,
      totalFat: 0.42,
      sugar: 0.30,
      milkFat: 0.06,
      milkSolidsNonFat: 0.15,
    );

    // White: Ivoire 35% (35% BC, 0% solids, 43% sugar, 6.4% milk fat, 15.6% lactose)
    final whiteChoc = const Chocolate(
      brand: "Valrhona",
      name: "Ivoire 35%",
      cocoaButter: 0.35,
      nonFatCocoaSolids: 0.0,
      totalFat: 0.414,
      sugar: 0.43,
      milkFat: 0.064,
      milkSolidsNonFat: 0.22,
    );

    // --- STEP 1: CALCULATE INGREDIENTS (The formulation logic) ---
    
    // Target BC based on Professional Plasticity Rules (Rules from user)
    double targetBCRatio = 0.20; // Default
    
    // 1. Determine base ratio from chocolate type
    switch (chocolateTypeNotifier.selection) {
      case "Noir":
        targetBCRatio = 0.18;
        break;
      case "Noir/Lait":
        targetBCRatio = 0.20;
        break;
      case "Lait":
        targetBCRatio = 0.22;
        break;
      case "Blanc":
        targetBCRatio = 0.23;
        break;
    }

    // 2. Adjust for Application (Moulage cap 12-18%)
    if (app.currentView == Application.moulage) {
      // If the target ratio is higher than 18%, we cap it for molding
      if (targetBCRatio > 0.18) {
        targetBCRatio = 0.18; 
      }
      // Safety check: never below 12%
      if (targetBCRatio < 0.12) {
        targetBCRatio = 0.12;
      }
    }
    
    double targetBCWeight = total * targetBCRatio;

    if (chocolateTypeNotifier.selection == "Noir/Lait") {
      // Split BC 50/50 between Dark and Milk
      double bcPart = targetBCWeight / 2;
      chocolateWeight = bcPart / darkChoc.cocoaButter; // Dark part
      milkChocolateWeight = bcPart / milkChoc.cocoaButter; // Milk part
    } else if (chocolateTypeNotifier.selection == "Lait") {
      chocolateWeight = 0;
      milkChocolateWeight = targetBCWeight / milkChoc.cocoaButter;
    } else if (chocolateTypeNotifier.selection == "Blanc") {
      chocolateWeight = targetBCWeight / whiteChoc.cocoaButter;
      milkChocolateWeight = 0;
    } else {
      chocolateWeight = targetBCWeight / darkChoc.cocoaButter;
      milkChocolateWeight = 0;
    }

    // Target Added Sugar: Total target 26%
    double targetTotalSugarWeight = total * 0.26;
    
    double sugarFromDark = 0;
    if (chocolateTypeNotifier.selection == "Blanc") {
      sugarFromDark = chocolateWeight * whiteChoc.sugar;
    } else {
      sugarFromDark = chocolateWeight * darkChoc.sugar;
    }
    double sugarFromMilk = milkChocolateWeight * milkChoc.sugar;
    sugarWeight = targetTotalSugarWeight - (sugarFromDark + sugarFromMilk);
    if (sugarWeight < 0) sugarWeight = 0;

    // Target Butter: 6% (from your example)
    butterWeight = total * 0.06;

    // Deduced Liquid (Cream 35%)
    creamWeight = total - (chocolateWeight + milkChocolateWeight + sugarWeight + butterWeight);
    if (creamWeight < 0) creamWeight = 0;

    // --- STEP 2: ANALYTICAL TABLE (Summing columns) ---
    
    // Ingredient constants
    const double waterInCream = 0.598; 
    const double milkFatInCream = 0.35;
    const double lactoseInCream = 0.028;
    const double waterInButter = 0.16;
    const double milkFatInButter = 0.82;

    // Column sums
    waterWeight = (creamWeight * waterInCream) + (butterWeight * waterInButter);
    
    if (chocolateTypeNotifier.selection == "Blanc") {
      cocoaButterWeight = chocolateWeight * whiteChoc.cocoaButter;
      defattedCocoaWeight = 0.0;
      milkFatWeight = (creamWeight * milkFatInCream) + 
                     (butterWeight * milkFatInButter) + 
                     (chocolateWeight * whiteChoc.milkFat);
      
      totalSugarWeight = (chocolateWeight * whiteChoc.sugar) + 
                        (sugarWeight * 1.0) + 
                        (creamWeight * lactoseInCream) + 
                        (chocolateWeight * whiteChoc.milkSolidsNonFat * 0.5);

      totalPODWeight = (chocolateWeight * whiteChoc.sugar * 1.0) + 
                      (sugarWeight * 1.0) + 
                      (creamWeight * lactoseInCream * 0.16);
    } else {
      cocoaButterWeight = (chocolateWeight * darkChoc.cocoaButter) + 
                         (milkChocolateWeight * milkChoc.cocoaButter);
      
      defattedCocoaWeight = (chocolateWeight * darkChoc.nonFatCocoaSolids) + 
                           (milkChocolateWeight * milkChoc.nonFatCocoaSolids);
      
      milkFatWeight = (creamWeight * milkFatInCream) + 
                     (butterWeight * milkFatInButter) + 
                     (milkChocolateWeight * milkChoc.milkFat);
      
      totalSugarWeight = (chocolateWeight * darkChoc.sugar) + 
                        (milkChocolateWeight * milkChoc.sugar) + 
                        (sugarWeight * 1.0) + 
                        (creamWeight * lactoseInCream) + 
                        (milkChocolateWeight * milkChoc.milkSolidsNonFat * 0.5);

      totalPODWeight = (chocolateWeight * darkChoc.sugar * 1.0) + 
                      (milkChocolateWeight * milkChoc.sugar * 1.0) + 
                      (sugarWeight * 1.0) + 
                      (creamWeight * lactoseInCream * 0.16);
    }
    
    totalFatWeight = cocoaButterWeight + milkFatWeight;
    totalSolidsWeight = total - waterWeight;

    // --- STEP 3: PERCENTAGES & AW ---
    waterPercentage = waterWeight / total;
    cocoaButterPercentage = cocoaButterWeight / total;
    sugarPercentage = totalSugarWeight / total;
    solidsPercentage = totalSolidsWeight / total;
    totalFatPercentage = totalFatWeight / total;
    sweeteningPower = (totalPODWeight / total) * 100;

    // Aw Ross Formula (Simplified with Dry Matter sponging)
    double sugarRatio = totalSugarWeight / (totalSugarWeight + waterWeight);
    awValue = 1.0 - (0.65 * sugarRatio) - (0.04 * (defattedCocoaWeight / total));

    notifyListeners();
  }
}
