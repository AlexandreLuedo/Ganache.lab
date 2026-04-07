import 'package:flutter/material.dart';
import 'package:ganache_lab/models/notifiers/chocolate_type_notifier.dart';
import 'package:ganache_lab/models/notifiers/weight_ganache_notifier.dart';
import 'package:ganache_lab/widgets/ganache_type_selection.dart';

class TotalModel extends ChangeNotifier {
  double total = 0.0;
  double neededCocoaButterWeight = 0.0;
  double?
  cocoaButterChocolate; // TODO Make an variable who store the chocolate cocoa butter
  double? sugarChocolate; // Assuming 0.XX
  double? chocolateWeight;
  double recommendedSugar = ((25 + 30) / 2) / 100; // Recommended 25 at 30%
  double recommendedButter = ((5 + 15) / 2) / 100; // Recommended 5 at 15%
  double? sugarWeight;
  double? butterWeight;
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
    // Determine the needed chocolate weight
    // chocolateWeight =
    //     (totalCocoaButter.cocoaButterType * total) *
    //     (total * cocoaButterChocolate!); // Temporary non-nullable

    // Determine the needed sugar weight
    // Temporary non-nullable
    if ((total * recommendedSugar) > (sugarChocolate! * chocolateWeight!)) {
      sugarWeight =
          (total * recommendedSugar) - (sugarChocolate! * chocolateWeight!);
    } else {
      sugarWeight =
          (sugarChocolate! * chocolateWeight!) - (total * recommendedSugar);
    }

    // Determine the needed fats
    butterWeight = total * recommendedButter;

    // Deduct the cream
    creamWeight = total - (chocolateWeight! + sugarWeight! + butterWeight!);

    notifyListeners();
  }
}
