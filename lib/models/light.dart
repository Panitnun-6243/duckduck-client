import 'package:flutter/material.dart';

enum LightMode { rgb, temperature }

class Light {
  Color? rgbColor;
  Color? cctColor;
  double? brightness;
  int? levelOfBrightness;
  LightMode? mode;
  int? temperature;

  Light({
    this.rgbColor,
    this.cctColor,
    this.brightness,
    this.levelOfBrightness,
    this.mode,
    this.temperature,
  });

  Color? get activeColor => mode == LightMode.rgb ? rgbColor : cctColor;
}
