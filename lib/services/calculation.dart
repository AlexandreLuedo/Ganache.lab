import 'package:flutter/material.dart';
import 'package:ganache_lab/models/weight_ganache_notifier.dart';
import 'package:ganache_lab/screens/calculate_ganache.dart';
import 'package:ganache_lab/widgets/ganache_type_selection.dart';
import 'package:ganache_lab/widgets/total_weight.dart';

class TotalModel extends ChangeNotifier {
  double total = 0.0;

  void calculateTotal(
    FrameModel frame,
    MoldModel mold,
    OtherModel other,
    ApplicationModel app,
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
    notifyListeners();
  }
}
