import 'package:flutter/material.dart';

import '../models/light.dart';
import '../utils/kelvin_to_rgb.dart';

class LightProvider with ChangeNotifier {
  final Light _light = Light();

  Color get activeColor => _light.activeColor;
  Color get rgbColor => _light.rgbColor;
  double get brightness => _light.brightness;
  int get levelOfBrightness => _light.levelOfBrightness;
  LightMode get currentMode => _light.mode;
  int get temperature => _light.temperature;
  int currentModeTab = 0;

  void setColor(Color newColor) {
    if (_light.mode == LightMode.rgb) {
      _light.rgbColor = newColor;
    } else {
      _light.cctColor = newColor;
    }
    _notifyChanges();
  }

  void setBrightness(double newBrightness) {
    _light.brightness = newBrightness;
    _updateLevelOfBrightness(newBrightness);
    _notifyChanges();
  }

  void setMode(LightMode mode) {
    _light.mode = mode;
    currentModeTab = (_light.mode == LightMode.rgb) ? 0 : 1;
    _notifyChanges();
  }

  void setTemperature(int temperature) {
    _light.temperature = temperature;
    _light.cctColor = _getColorFromTemperature(temperature);
    _notifyChanges();
  }

  void _updateLevelOfBrightness(double brightness) {
    if (brightness < 25) {
      _light.levelOfBrightness = 1;
    } else if (brightness < 50) {
      _light.levelOfBrightness = 2;
    } else if (brightness < 75) {
      _light.levelOfBrightness = 3;
    } else {
      _light.levelOfBrightness = 4;
    }
  }

  Color _getColorFromTemperature(int temp) {
    if (kelvinTable.containsKey(temp)) {
      return kelvinTable[temp]!;
    }
    int closestTemp = kelvinTable.keys
        .reduce((a, b) => (temp - a).abs() < (temp - b).abs() ? a : b);
    return kelvinTable[closestTemp]!;
  }

  void _notifyChanges() => notifyListeners();
}
