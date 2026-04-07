import 'package:flutter/material.dart';

/// class pouvant stocker le Titre de la ganache
class TitleModel extends ChangeNotifier {
  String _title = '';

  String get title => _title;

  // le "newTitle" réinitialise la variable et la rend réutilisable.
  void update(String newTitle) {
    _title = newTitle;
    notifyListeners();
  }

  void reset() {
    _title = "";
    notifyListeners();
  }
}