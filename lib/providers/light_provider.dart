import 'package:flutter/material.dart';

import '../models/light.dart';

class LightProvider with ChangeNotifier {
  final Light _light = Light();

  Color get currentColor => _light.color;
  double get brightness => _light.brightness;
  int get levelOfBrightness => _light.levelOfBrightness;

  void setColor(Color newColor) {
    _light.color = newColor;
    notifyListeners();
  }

  void setBrightness(double newBrightness) {
    _light.brightness = newBrightness;
    setLevelOfBrightness(newBrightness);
    notifyListeners();
  }

  void setLevelOfBrightness(double brightness) {
    int newLevelOfBrightness;
    if (brightness < 25) {
      newLevelOfBrightness = 1;
    } else if (brightness < 50) {
      newLevelOfBrightness = 2;
    } else if (brightness < 75) {
      newLevelOfBrightness = 3;
    } else {
      newLevelOfBrightness = 4;
    }
    _light.levelOfBrightness = newLevelOfBrightness;
    notifyListeners();
  }
}
