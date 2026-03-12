import 'package:flutter/material.dart';

// Get the chocolate type value by the user selection
class ChocolateTypeModel extends ChangeNotifier {
  int? _cocoaButter;
  String? _selection;

  int? get cocoaButter => _cocoaButter;
  String? get selection => _selection;

  double get cocoaButterType {
    switch (_selection) {
      case "Noir":
        return 0.18;
      case "Lait":
        return 0.22;
      case "Noir/Lait":
        return 0.20;
      case "Blanc":
        return 0.23;
      case "Autre":
      default:
        return 0.20;
    }
  }

  /// DOC
  /// Use me :
  /// double beurreDeCacao = Provider.of<ChocolateTypeModel>(context, listen: false).cocoaButterType;

  void updateSelection(String? newValue) {
    _selection = newValue;
    notifyListeners();
  }
}
