import 'package:flutter/material.dart';

// Moulage
class MouleModel extends ChangeNotifier {
  int _weight = 0;
  int _numberMussles = 0; // C'est le nombre d'empreintes de moules (au cas où).
  int _mouleResult = 0;
  int _numberMoule = 0;

  int get weight => _weight;
  int get numberMussles => _numberMussles;
  int get numberMoule => _numberMoule;
  int get mouleResult => _mouleResult;

  void updateWeight(int newWeight) {
    _weight = newWeight;
    notifyListeners();
  }

  void updateNumberMussles(int newNumberMussles) {
    _numberMussles = newNumberMussles;
    notifyListeners();
  }

  void updateNumberMoule(int newNumberMoule) {
    _numberMoule = newNumberMoule;
    notifyListeners();
  }

  void calculate(int newMouleResult) {
    _mouleResult = _weight * _numberMussles;
    notifyListeners();
  }
}

// Cadrage
class CadreModel extends ChangeNotifier {
  double _lenght = 0;
  double _height = 0;
  int _numberCadres = 0; // Nom de variable peux-être à revoir
  double _cadreResult = 0;
  final double ratioNumber = 1.13636364; // DOC ratio masse/volume

  double get lenght => _lenght;
  double get height => _height;
  int get numberCadres => _numberCadres;
  double get cadreResult => _cadreResult;

  void updateLenght(double newLenght) {
    _lenght = newLenght;
    notifyListeners();
  }

  void updateHeight(double newHeight) {
    _height = newHeight;
    notifyListeners();
  }

  void updateNumberCadres(int newNumberCadres) {
    _numberCadres = newNumberCadres;
    notifyListeners();
  }

  void calculate(int newCadreResult) {
    if (_numberCadres == 0) {
      _numberCadres == 1;
    }
    _cadreResult = (_lenght * 2) * _height * _numberCadres;
    _cadreResult = _cadreResult*ratioNumber;
    notifyListeners();
  }
}

// Autre
class AutreModel extends ChangeNotifier {
  int _totalWeight = 0;
  int get totalWeight => _totalWeight;

  void updateTotalAutre(int newTotalWeight) {
    _totalWeight = newTotalWeight;
    notifyListeners();
  }
}

class Total extends ChangeNotifier {
  double _total = 0;
  double get total => _total;

  void updateTotal(double value) {
    _total = value;
    notifyListeners();
  }

  void reset() {
    _total = 0;
    notifyListeners();
  }
}

