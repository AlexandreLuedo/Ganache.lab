import 'package:flutter/material.dart';
import 'package:ganache_lab/models/notifiers/chocolate_type_notifier.dart';
import 'package:ganache_lab/models/notifiers/weight_ganache_notifier.dart';
import 'package:ganache_lab/widgets/ganache_type_selection.dart';

class TotalModel extends ChangeNotifier {
  // Total weight
  double total = 0.0;

  // Chocolate
  double? chocolateWeight;
  double?
  cocoaButterInChocolate; // TODO Make a variable to store the chocolate cocoa butter
  double? sugarInChocolate; // Assuming 0.XX

  // Sugar
  double recommendedSugar = ((25 + 30) / 2) / 100; // Recommended 25 to 30%
  double? sugarWeight;

  // Butter
  double recommendedButter = ((5 + 15) / 2) / 100; // Recommended 5 to 15%
  double? butterWeight;

  // Cream
  double? creamWeight;

  void calculateTotal(
    FrameModel frame,
    MoldModel mold,
    OtherModel other,
    ApplicationModel app,
    ChocolateTypeModel totalCocoaButter,
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

    /// DOC
    /// Generate the ganache

    // 1. Determine the needed chocolate weight
    // Temporary non-nullable
    chocolateWeight =
        (totalCocoaButter.cocoaButterType * total) / cocoaButterInChocolate!;

    // 2. Determine the needed sugar weight
    // Temporary non-nullable
    double targetSugar = total * recommendedSugar;
    double sugarFromChocolate = chocolateWeight! * sugarInChocolate!;

    if (targetSugar > sugarFromChocolate) {
      sugarWeight = targetSugar - sugarFromChocolate;
    } else {
      sugarWeight = 0;
    }

    // 3. Determine the needed fats
    butterWeight = total * recommendedButter;

    // 4. Deduct the cream
    creamWeight = total - (chocolateWeight! + sugarWeight! + butterWeight!);

    notifyListeners();
  }
}
