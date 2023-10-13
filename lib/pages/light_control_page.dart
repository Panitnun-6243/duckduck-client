import 'package:duckduck/widgets/light_control/brightness_gauge.dart';
import 'package:duckduck/widgets/light_control/light_color_picker.dart';
import 'package:flutter/material.dart';

class LightControlPage extends StatefulWidget {
  const LightControlPage({super.key});

  @override
  State<LightControlPage> createState() => _LightControlPageState();
}

class _LightControlPageState extends State<LightControlPage> {
  @override
  Widget build(BuildContext context) {
    double _bottomPadding = MediaQuery.of(context).size.height * 0.055;
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
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              const Text('SVG Bulb'),
              Stack(
                alignment: Alignment.center,
                children: [
                  const BrightnessGauge(),
                  Positioned(
                    bottom: _bottomPadding,
                    child: const LightColorPicker(),
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
