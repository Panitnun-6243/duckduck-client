import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgBulb extends StatelessWidget {
  final Color color;
  final double brightness;
  final String assetName = 'assets/images/light-bulb.svg';
  final int levelOfBrightness;

  const SvgBulb(
      {super.key,
      required this.color,
      required this.brightness,
      required this.levelOfBrightness});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: brightness / 100, // Convert the brightness value from 0 to 1.
      child: SvgPicture.asset(
        assetName,
        semanticsLabel: 'Light bulb',
        color: color,
      ),
    );
  }
}
