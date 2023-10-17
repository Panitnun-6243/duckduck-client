import 'package:flutter/material.dart';

import '../models/light.dart';
import '../utils/kelvin_to_rgb.dart';

class LightProvider with ChangeNotifier {
  final Light _light = Light();

  Color get activeColor => _light.activeColor;
  // Color get rgbColor => _light.color;
  double get brightness => _light.brightness;
  int get levelOfBrightness => _light.levelOfBrightness;
  LightMode get currentMode => _light.mode;
  int get temperature => _light.temperature;
  int currentModeTab = 0;

  // Color get temperatureColor => getColorFromTemperature(_light.temperature);

  void setColor(Color newColor) {
    if (_light.mode == LightMode.rgb) {
      _light.rgbColor = newColor;
    } else {
      _light.cctColor = newColor;
    }
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
    if (_light.mode == LightMode.rgb) {
      currentModeTab = 0;
    } else {
      currentModeTab = 1;
    }
    notifyListeners();
  }

  void setTemperature(int temperature) {
    _light.temperature = temperature;
    // Convert temperature to RGB here and set _light.color
    _light.cctColor = getColorFromTemperature(temperature);

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
