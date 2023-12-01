import 'package:flutter/material.dart';

import '../models/light.dart';
import '../utils/kelvin_to_rgb.dart';

class LightProvider with ChangeNotifier {
  final Light _light = Light();

  Color get activeColor => _light.activeColor ?? rgbColor;
  Color get rgbColor => _light.rgbColor ?? const Color(0xfff2DB6F);
  Color get cctColor =>
      _light.cctColor ?? const Color.fromRGBO(255, 138, 18, 1);
  double get brightness => _light.brightness ?? 51;
  int get levelOfBrightness => _light.levelOfBrightness ?? 3;
  LightMode get currentMode => _light.mode ?? LightMode.rgb;
  int get temperature => _light.temperature ?? 2000;
  String get id => _light.id ?? '1';
  int currentModeTab = 0;

  void setColor(Color newColor) {
    setMode(LightMode.rgb);
    _light.rgbColor = newColor;
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
    setMode(LightMode.temperature);
    _notifyChanges();
  }

  void setId(String id) {
    _light.id = id;
    _notifyChanges();
  }

  void setLight(Light light) {
    _light.rgbColor = light.rgbColor;
    _light.cctColor = light.cctColor;
    _light.brightness = light.brightness;
    _light.levelOfBrightness = light.levelOfBrightness;
    _light.mode = light.mode;
    _light.temperature = light.temperature;
    _light.id = light.id;
    _notifyChanges();
  }

  void setLightPassive(Light light) {
    _light.rgbColor = light.rgbColor;
    _light.cctColor = light.cctColor;
    _light.brightness = light.brightness;
    _light.levelOfBrightness = light.levelOfBrightness;
    _light.mode = light.mode;
    _light.temperature = light.temperature;
    _light.id = light.id;
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
