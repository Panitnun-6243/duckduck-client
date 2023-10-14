import 'package:flutter/material.dart';

import '../models/light.dart';

class LightProvider with ChangeNotifier {
  final Light _light = Light(color: const Color(0xfff2DB6F), brightness: 50);

  Color get currentColor => _light.color;
  double get brightness => _light.brightness;

  void setColor(Color newColor) {
    _light.color = newColor;
    notifyListeners();
  }

  void setBrightness(double newBrightness) {
    _light.brightness = newBrightness;
    notifyListeners();
  }
}
