import 'package:flutter/material.dart';

// Moulage
class MoldModel extends ChangeNotifier {
  double _weight = 0;
  int _numberMussles = 0; // number of mussles per molds
  double _moldResult = 0;
  double _numberMold = 0;

  double get weight => _weight;
  int get numberMussles => _numberMussles;
  double get numberMold => _numberMold;
  double get moldResult => _moldResult;

  void reset() {
    _weight = 0;
    _numberMussles = 0;
    _moldResult = 0;
    _numberMold = 0;
    notifyListeners();
  }

  void updateWeight(double newWeight) {
    _weight = newWeight;
    calculate();
    notifyListeners();
  }

  void updateNumberMussles(int newNumberMussles) {
    _numberMussles = newNumberMussles;
    calculate();
    notifyListeners();
  }

  void updateNumberMold(double newNumberMold) {
    _numberMold = newNumberMold;
    calculate();
    notifyListeners();
  }

  void calculate() {
    if (_numberMold == 0) {
      _numberMold = 1;
    }
    _moldResult = _weight * _numberMussles * _numberMold;
    notifyListeners();
  }
}

// Cadrage
class FrameModel extends ChangeNotifier {
  double _lenght = 0;
  double _width = 0;
  double _height = 0;
  double _numberFrames = 0; // Maybe rewrite var name ?
  double _frameResult = 0;
  final double ratioNumber = 1.13636364; // DOC ratio masse/volume

  double get lenght => _lenght;
  double get width => _width;
  double get height => _height;
  double get numberFrames => _numberFrames;
  double get frameResult => _frameResult;

  void reset() {
    _lenght = 0;
    _width = 0;
    _height = 0;
    _numberFrames = 0;
    _frameResult = 0;
    notifyListeners();
  }

  void updateLenght(double newLenght) {
    _lenght = newLenght;
    calculate();
    notifyListeners();
  }

  void updateWidth(double newWidth) {
    _width = newWidth;
    calculate();
    notifyListeners();
  }

  void updateHeight(double newHeight) {
    _height = newHeight;
    calculate();
    notifyListeners();
  }

  void updateNumberFrames(double newNumberFrames) {
    _numberFrames = newNumberFrames;
    calculate();
    notifyListeners();
  }

  void calculate() {
    if (_numberFrames == 0) {
      _numberFrames = 1;
    }
    _frameResult = _lenght * _width * _height * _numberFrames * ratioNumber;
    notifyListeners();
  }
}

// Autre
class OtherModel extends ChangeNotifier {
  double _otherWeight = 0;
  double get otherWeight => _otherWeight;

  void reset() {
    _otherWeight = 0;
    notifyListeners();
  }

  void updateTotalOther(double newOtherWeight) {
    _otherWeight = newOtherWeight;
    notifyListeners();
  }
}

// The TotalModel is in calculation.dart file.
