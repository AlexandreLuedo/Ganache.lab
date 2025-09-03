import 'package:flutter/material.dart';


// Titre de la ganache
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

// Moulage
class MouleOptions extends ChangeNotifier {
  int _weight = 0;
  int _numberMussles = 0;   // C'est le nombre d'empreintes de moules (au cas où).
  int _mouleResult = 0;

  int get weight => _weight;
  int get numberMussles => _numberMussles;
  int get mouleResult => _mouleResult;


  void updateWeight(int newWeight) {
    _weight = newWeight;
    notifyListeners();
  }
  void udpateNumberMussles(int newNumberMussles) {
    _numberMussles = newNumberMussles;
    notifyListeners();
  }

  void calculate(int newMouleResult) {
    _mouleResult = _weight * _numberMussles;
    notifyListeners();
  }
}

// Cadrage
class CadreOptions extends ChangeNotifier {
  int _lenght = 0;
  int _height = 0;
  int _numberCadres = 0; // Nom de variable peux-être à revoir

  int get lenght => _lenght;
  int get height => _height;
  int get numberCadres => _numberCadres;

  void updateLenght(int newLenght) {
    _lenght = newLenght;
  }
  void updateHeight(int newHeight) {
    _height = newHeight;
  }
  void updateNumberCadres(int newNumberCadres) {
    _numberCadres = newNumberCadres;
  }
}

// Autre
class AutresOptions extends ChangeNotifier {
  int _totalWeight = 0;
  int get totalWeight => _totalWeight;

  void update (int newTotalWeight) {
    _totalWeight = newTotalWeight;
    notifyListeners();
  }
}