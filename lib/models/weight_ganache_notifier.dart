import 'package:flutter/material.dart';
import 'package:ganache_lab/widgets/ganache_type_selection.dart';

// Moulage
class MoldModel extends ChangeNotifier {
  int _weight = 0;
  int _numberMussles = 0; // nombre d'empreintes de moules
  int _moldResult = 0;
  int _numberMold = 0;

  int get weight => _weight;
  int get numberMussles => _numberMussles;
  int get numberMold => _numberMold;
  int get moldResult => _moldResult;

  void updateWeight(int newWeight) {
    _weight = newWeight;
    calculate();
    notifyListeners();
  }

  void updateNumberMussles(int newNumberMussles) {
    _numberMussles = newNumberMussles;
    calculate();
    notifyListeners();
  }

  void updateNumberMold(int newNumberMold) {
    _numberMold = newNumberMold;
    calculate();
    notifyListeners();
  }

  void calculate() {
    _moldResult = _weight * _numberMussles;
    notifyListeners();
  }
}

// Cadrage
class FrameModel extends ChangeNotifier {
  double _lenght = 0;
  double _height = 0;
  int _numberFrames = 0; // Nom de variable peux-être à revoir
  double _frameResult = 0;
  final double ratioNumber = 1.13636364; // DOC ratio masse/volume

  double get lenght => _lenght;
  double get height => _height;
  int get numberFrames => _numberFrames;
  double get frameResult => _frameResult;

  void updateLenght(double newLenght) {
    _lenght = newLenght;
    calculate();
    notifyListeners();
  }

  void updateHeight(double newHeight) {
    _height = newHeight;
    calculate();
    notifyListeners();
  }

  void updateNumberFrames(int newNumberFrames) {
    _numberFrames = newNumberFrames;
    calculate();
    notifyListeners();
  }

  void calculate() {
    if (_numberFrames == 0) {
      _numberFrames = 1;
    }
    _frameResult = (_lenght * 2) * _height * _numberFrames;
    _frameResult = _frameResult * ratioNumber;
  }
}

// Autre
class OtherModel extends ChangeNotifier {
  int _otherWeight = 0;
  int get otherWeight => _otherWeight;

  void updateTotalOther(int newOtherWeight) {
    _otherWeight = newOtherWeight;
    notifyListeners();
  }
}

// The TotalModel is in calculation.dart file.
