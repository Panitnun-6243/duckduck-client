import 'package:duckduck/models/light.dart';
import 'package:duckduck/providers/light_provider.dart';
import 'package:duckduck/widgets/light_control/brightness_gauge.dart';
import 'package:duckduck/widgets/light_control/light_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/light_control/svg_bulb.dart';

class LightControlPage extends StatefulWidget {
  final Future<Light> Function() fetchLight;
  final void Function(Light, LightMode?) putLight;
  const LightControlPage(
      {super.key, required this.fetchLight, required this.putLight});

  @override
  State<LightControlPage> createState() => _LightControlPageState();
}

class _LightControlPageState extends State<LightControlPage> {
  late Future<Light> lightFuture;

  @override
  void initState() {
    super.initState();
    lightFuture = widget.fetchLight();
  }

  @override
  Widget build(BuildContext context) {
    final lightProvider = context.watch<LightProvider>();
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
                      lightProvider.setLightPassive(light);
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgBulb(
                            color: lightProvider.rgbColor,
                            brightness: lightProvider.brightness,
                            levelOfBrightness: lightProvider.levelOfBrightness,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              BrightnessGauge(
                                  putLight: (light) =>
                                      widget.putLight(light, null)),
                              Positioned(
                                bottom: bottomLightPadding,
                                child: LightColorPicker(
                                    activeColor: lightProvider.rgbColor,
                                    putLight: widget.putLight),
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
