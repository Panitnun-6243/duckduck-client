import 'package:flutter/material.dart';

import '../models/light.dart';
import '../utils/kelvin_to_rgb.dart';

class LightProvider with ChangeNotifier {
  final Light _light = Light();

  Color get rgbColor => _light.color;
  double get brightness => _light.brightness;
  int get levelOfBrightness => _light.levelOfBrightness;
  LightMode get currentMode => _light.mode;
  int get temperature => _light.temperature;
  // Color get temperatureColor => getColorFromTemperature(_light.temperature);

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

  void setMode(LightMode mode) {
    _light.mode = mode;
    notifyListeners();
  }

  void setTemperature(int temperature) {
    print(temperature);
    _light.temperature = temperature;
    // Convert temperature to RGB here and set _light.color
    _light.color = getColorFromTemperature(temperature);

    notifyListeners();
  }

  Color getColorFromTemperature(int temp) {
    if (kelvinTable.containsKey(temp)) {
      return kelvinTable[temp]!;
    } else {
      // Find the nearest temperature value (you can enhance this with interpolation if needed)
      int closestTemp = kelvinTable.keys
          .reduce((a, b) => (temp - a).abs() < (temp - b).abs() ? a : b);
      return kelvinTable[closestTemp]!;
    }
  }
}
