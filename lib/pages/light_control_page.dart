import 'package:duckduck/providers/light_provider.dart';
import 'package:duckduck/widgets/light_control/brightness_gauge.dart';
import 'package:duckduck/widgets/light_control/light_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/light_control/svg_bulb.dart';

class LightControlPage extends StatefulWidget {
  const LightControlPage({super.key});

  @override
  State<LightControlPage> createState() => _LightControlPageState();
}

class _LightControlPageState extends State<LightControlPage> {
  @override
  Widget build(BuildContext context) {
    final lightProvider = context.watch<LightProvider>();
    double bottomLightPadding = MediaQuery.of(context).size.height * 0.095;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 35,
            right: 35,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgBulb(
                color: lightProvider.activeColor,
                brightness: lightProvider.brightness,
                levelOfBrightness: lightProvider.levelOfBrightness,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  const BrightnessGauge(),
                  Positioned(
                    bottom: bottomLightPadding,
                    child: LightColorPicker(
                        activeColor: lightProvider.activeColor),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
