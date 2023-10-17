import 'package:flutter/material.dart';

enum LightMode { rgb, temperature }

class Light {
  Color rgbColor;
  Color cctColor;
  double brightness;
  int levelOfBrightness;
  LightMode mode;
  int temperature; // value in kelvin

  Light({
    this.rgbColor = const Color(0xfff2DB6F),
    this.cctColor = const Color(0xfff2DB6F),
    this.brightness = 51,
    this.levelOfBrightness = 3,
    this.mode = LightMode.rgb,
    this.temperature = 5000,
  });

  Color get activeColor => mode == LightMode.rgb ? rgbColor : cctColor;
}
