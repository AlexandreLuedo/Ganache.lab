import 'package:flutter/material.dart';

// Get the chocolate type value by the user selection
class ChocolateTypeModel extends ChangeNotifier {
  int? _cocoaButter;
  String? _selection;

  int? get cocoaButter => _cocoaButter;
  String? get selection => _selection;

  void updateSelection(String? newValue) {
    _selection = newValue;
    notifyListeners();
  }
}
