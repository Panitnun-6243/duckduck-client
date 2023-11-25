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

  // Initialize object from data received by MQTT and API
  factory Light.fromJson(Map<dynamic,dynamic> json) {
    Color hsl = Color.fromARGB(255, json['hsl_color']['h'], json['hsl_color']['s'], json['hsl_color']['l']);
    Color cct = Color.fromARGB(255, json['hsl_color']['h'], json['hsl_color']['s'], json['hsl_color']['l']);
    int levelOfBrightness = json['brightness'];
    double brightness = levelOfBrightness.toDouble();
    LightMode mode = json['color_mode'] == 'hsl' ? LightMode.rgb : LightMode.temperature;
    int temperature = json['temp'];
    return Light(
      rgbColor: hsl,
      cctColor: cct,
      brightness: brightness,
      levelOfBrightness: levelOfBrightness,
      mode: mode,
      temperature: temperature
    );
  }
}
