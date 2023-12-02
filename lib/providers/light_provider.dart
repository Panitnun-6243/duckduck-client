import 'package:flutter/material.dart';

import '../models/light.dart';
import '../utils/kelvin_to_rgb.dart';

class LightProvider with ChangeNotifier {
  final Light _light = Light();

  Color get activeColor => (_light.mode == LightMode.rgb ? _light.rgbColor : _light.cctColor) ?? const Color(0xffAADBAA);
  Color get rgbColor => _light.rgbColor ?? const Color(0xfff2DB6F);
  Color get cctColor =>
      _light.cctColor ?? const Color.fromRGBO(255, 138, 18, 1);
  double get brightness => _light.brightness ?? 51;
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
    _notifyChanges();
  }

  void setMode(LightMode mode) {
    setModePassive(mode);
    _notifyChanges();
  }

  void setModePassive(LightMode mode) {
    _light.mode = mode;
    currentModeTab = (_light.mode == LightMode.rgb) ? 0 : 1;
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
    _light.mode = light.mode;
    _light.temperature = light.temperature;
    _light.id = light.id;
    _notifyChanges();
  }

  void setLightPassive(Light light) {
    _light.rgbColor = light.rgbColor;
    _light.cctColor = light.cctColor;
    _light.brightness = light.brightness;
    _light.mode = light.mode;
    _light.temperature = light.temperature;
    _light.id = light.id;
    if (light.mode != null) {
      setModePassive(light.mode!);
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
