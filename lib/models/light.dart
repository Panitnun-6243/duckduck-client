import 'package:duckduck/utils/kelvin_to_rgb.dart';
import 'package:flutter/material.dart';

enum LightMode { rgb, temperature }

class Light {
  Color? rgbColor;
  Color? cctColor;
  double? brightness;
  LightMode? mode;
  int? temperature;
  String? id;

  Light(
      {this.rgbColor,
      this.cctColor,
      this.brightness,
      this.mode,
      this.temperature,
      this.id});

  Color? get activeColor => mode == LightMode.rgb ? rgbColor : cctColor;

  // Initialize object from data received by MQTT and API
  factory Light.fromJson(Map<dynamic, dynamic> json) {
    Color hsl = HSLColor.fromAHSL(
            1.0,
            json['hsl_color']['h'].toDouble() * 2,
            json['hsl_color']['s'].toDouble() / 100,
            json['hsl_color']['l'].toDouble() / 100)
        .toColor();
    Color cct = HSLColor.fromAHSL(
            1.0,
            json['hsl_color']['h'].toDouble() * 2,
            json['hsl_color']['s'].toDouble() / 100,
            json['hsl_color']['l'].toDouble() / 100)
        .toColor();
    double brightness = json['brightness'];
    LightMode mode =
        json['color_mode'] == 'hsl' ? LightMode.rgb : LightMode.temperature;
    int temperature = json['temp'];
    String id = json["id"];
    return Light(
        rgbColor: hsl,
        cctColor: cct,
        brightness: brightness,
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

Color _getColorFromTemperature(int temp) {
    if (kelvinTable.containsKey(temp)) {
      return kelvinTable[temp]!;
    }
    int closestTemp = kelvinTable.keys
        .reduce((a, b) => (temp - a).abs() < (temp - b).abs() ? a : b);
    return kelvinTable[closestTemp]!;
  }
