import 'package:flutter/material.dart';

enum LightMode { rgb, temperature }

class Light {
  Color? rgbColor;
  Color? cctColor;
  double? brightness;
  int? levelOfBrightness;
  LightMode? mode;
  int? temperature;
  String? id;

  Light(
      {this.rgbColor,
      this.cctColor,
      this.brightness,
      this.levelOfBrightness,
      this.mode,
      this.temperature,
      this.id});

  Color? get activeColor => mode == LightMode.rgb ? rgbColor : cctColor;

  // Initialize object from data received by MQTT and API
  factory Light.fromJson(Map<dynamic, dynamic> json) {
    Color hsl = HSLColor.fromAHSL(
            1.0,
            json['hsl_color']['h'].toDouble(),
            json['hsl_color']['s'].toDouble() / 100,
            json['hsl_color']['l'].toDouble() / 100)
        .toColor();
    Color cct = HSLColor.fromAHSL(
            1.0,
            json['hsl_color']['h'].toDouble(),
            json['hsl_color']['s'].toDouble() / 100,
            json['hsl_color']['l'].toDouble() / 100)
        .toColor();
    int levelOfBrightness = json['brightness'];
    double brightness = levelOfBrightness.toDouble();
    LightMode mode =
        json['color_mode'] == 'hsl' ? LightMode.rgb : LightMode.temperature;
    int temperature = json['temp'];
    String id = json["id"];
    return Light(
        rgbColor: hsl,
        cctColor: cct,
        brightness: brightness,
        levelOfBrightness: levelOfBrightness,
        mode: mode,
        temperature: temperature,
        id: id);
  }

  // Map<dynamic,dynamic> toJson() {
  //   return {
  //     "hsl_color": {
  //       "h": rgbColor!.red,
  //       "s": rgbColor!.green,
  //       "l": rgbColor!.blue
  //     },
  //   }
  // }
}
