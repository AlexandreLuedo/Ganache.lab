import 'package:flutter/material.dart';

class TitleModel extends ChangeNotifier {
  String _title = '';
  String get title => _title;

  void update(String newTitle) {
    _title = newTitle;
    notifyListeners();
  }

  void reset() {
    _title = "";
    notifyListeners();
  }
}
