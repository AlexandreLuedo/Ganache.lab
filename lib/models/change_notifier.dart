import 'package:flutter/material.dart';
import 'config_loader.dart';
import 'package:ganache_lab/widgets/chip_ganache_type.dart';

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

/*
/// DOC Classe stockant le poids total de beurre de cacao présent dans la recette.
class TypeChocolateModel extends ChangeNotifier {
  /// Variables qui définisse le poids total de beurre de cacao en fonction du type de chocolat employé.
  final int _darkChocolateCocoaButter = 18;
  final int _milkChocolateCocoaButter = 22;
  final int _whiteChocolateCocoaButter = 23;
  final int _darkAndMilkChocolateCocoaButter = 20;
  final int _otherCocoaButter = 0;

  /// Inutile pour le moment et sera peux-être supprimé

  /// Variable qui définisse le poids total de beurre de cacao pour ganaches moulés.
  int _moldedDarkChocolateCocoaButter = 18;
  int _moldedMilkChocolateCocoaButter = 22;
  int _moldedWhiteChocolateCocoaButter = 23;
  int _moldedDarkAndMilkChocolateCocoaButter = 20;
  int _moldedOther = 0;

  int get darkChocolateCocoaButter => _darkChocolateCocoaButter;

  int get milkChocolateCocoaButter => _milkChocolateCocoaButter;

  int get whiteChocolateCocoaButter => _whiteChocolateCocoaButter;

  int get darkAndMilkChocolateCocoaButter => _darkAndMilkChocolateCocoaButter;

  int get otherCocoaButter => _otherCocoaButter;
}
*/
