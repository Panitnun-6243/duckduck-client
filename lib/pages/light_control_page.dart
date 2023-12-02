import 'package:duckduck/models/light.dart';
import 'package:duckduck/providers/light_provider.dart';
import 'package:duckduck/widgets/light_control/brightness_gauge.dart';
import 'package:duckduck/widgets/light_control/light_color_picker.dart';
import 'package:flutter/material.dart';
import '../widgets/light_control/svg_bulb.dart';

class LightControlPage extends StatefulWidget {
  final LightProvider lightProvider;
  final Future<Light> Function() fetchLight;
  final void Function(Light, LightMode?) putLight;
  const LightControlPage(
      {super.key, required this.lightProvider, required this.fetchLight, required this.putLight});

  @override
  State<LightControlPage> createState() => _LightControlPageState();
}

class _LightControlPageState extends State<LightControlPage> {
  late Future<Light> lightFuture;
  late Color bulbColor;
  late double bulbBrightness;
  bool isFetched = false;

  @override
  void initState() {
    super.initState();
    lightFuture = widget.fetchLight();
    bulbColor = widget.lightProvider.activeColor;
    bulbBrightness = widget.lightProvider.brightness;
  }

  void setBulbColor(Color newColor) {
    setState(() => bulbColor = newColor);
  }

  void setBulbBrightness(double newBrightness) {
    setState(() => bulbBrightness = newBrightness);
  }

  void setBulb(Color newColor, double newBrightness) {
    setState(() {
      bulbColor = newColor;
      bulbBrightness = newBrightness;
    });
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
                      if (!isFetched){
                        bulbColor = light.rgbColor!;
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
                                startValue: bulbBrightness,
                                putLight: (light) {
                                  light.rgbColor = bulbColor;
                                  widget.putLight(light, null);
                                },
                                setBulbBrightness: setBulbBrightness
                              ),
                              Positioned(
                                bottom: bottomLightPadding,
                                child: LightColorPicker(
                                  lightProvider: widget.lightProvider,
                                  putLight: widget.putLight,
                                  setBulb: setBulb
                                ),
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
