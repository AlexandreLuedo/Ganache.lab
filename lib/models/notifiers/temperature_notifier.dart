import 'package:flutter/material.dart';

class TemperatureModel extends ChangeNotifier {
  double _temperature = 32.0; // Default reasonable temp

  double get temperature => _temperature;

  void reset() {
    _temperature = 32.0;
    notifyListeners();
  }

  void updateTemperature(double newTemp) {
    _temperature = newTemp;
    notifyListeners();
  }
}
