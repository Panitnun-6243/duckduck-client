import 'package:duckduck/models/light.dart';
import 'package:duckduck/providers/authentication_provider.dart';
import 'package:duckduck/providers/light_provider.dart';
import 'package:duckduck/widgets/light_control/brightness_gauge.dart';
import 'package:duckduck/widgets/light_control/light_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/light_control/svg_bulb.dart';

class LightControlPage extends StatefulWidget {
  final LightProvider lightProvider;
  final Future<Light> Function() fetchLight;
  final void Function(Light, LightMode?) putLight;
  const LightControlPage(
      {super.key,
      required this.lightProvider,
      required this.fetchLight,
      required this.putLight});

  @override
  State<LightControlPage> createState() => _LightControlPageState();
}

class _LightControlPageState extends State<LightControlPage> {
  late Future<Light> lightFuture;
  late Color bulbColor;
  late double bulbBrightness;
  late LightMode bulbMode;
  late int bulbTemp;
  bool isFetched = false;

  @override
  void initState() {
    super.initState();
    lightFuture = widget.fetchLight();
    bulbColor = widget.lightProvider.activeColor;
    bulbBrightness = widget.lightProvider.brightness;
    bulbMode = widget.lightProvider.currentMode;
    bulbTemp = widget.lightProvider.temperature;
  }

  void setBulbColor(Color newColor) {
    setState(() => bulbColor = newColor);
  }

  void setBulbBrightness(double newBrightness) {
    setState(() => bulbBrightness = newBrightness);
  }

  void setBulb(Color newColor, double newBrightness) {
    print("set bulb $newColor $newBrightness");
    setState(() {
      bulbColor = newColor;
      bulbBrightness = newBrightness;
    });
  }

  void setMode(LightMode newMode) {
    setState(() => bulbMode = newMode);
  }

  void setTemp(int newTemp) {
    bulbTemp = newTemp;
  }

  @override
  Widget build(BuildContext context) {
    double bottomLightPadding = MediaQuery.of(context).size.height * 0.095;

    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: DuckDuckColors.steelBlack,
          child: Padding(
              padding: const EdgeInsets.only(
                left: 35,
                right: 35,
              ),
              child: FutureBuilder(
                  future: lightFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Light light = snapshot.data as Light;
                      widget.lightProvider.setLightPassive(light);
                      if (!isFetched) {
                        bulbMode = light.mode!;
                        if (light.mode == LightMode.rgb) {
                          bulbColor = light.rgbColor!;
                        } else if (light.mode == LightMode.temperature) {
                          bulbColor =
                              Light.getColorFromTemperature(light.temperature!);
                        }
                        isFetched = true;
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgBulb(
                            color: bulbColor,
                            brightness: bulbBrightness,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              BrightnessGauge(
                                  mode: bulbMode,
                                  startValue: bulbBrightness,
                                  putLight: (light) {
                                    light.rgbColor = bulbColor;
                                    light.temperature = bulbTemp;
                                    widget.putLight(light, null);
                                  },
                                  setBulbBrightness: setBulbBrightness),
                              Positioned(
                                bottom: bottomLightPadding,
                                child: LightColorPicker(
                                    mode: bulbMode,
                                    brightness: bulbBrightness,
                                    color: bulbColor,
                                    lightProvider: widget.lightProvider,
                                    putLight: (Light light, LightMode mode) {
                                      print("$bulbMode");
                                      return widget.putLight(light, mode);
                                    },
                                    setBulb: setBulb,
                                    setMode: setMode,
                                    setTemp: setTemp),
                              )
                            ],
                          ),
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  })),
        ),
      ),
    );
  }
}
