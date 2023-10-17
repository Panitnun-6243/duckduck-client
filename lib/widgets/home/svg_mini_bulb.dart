import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgMiniBulb extends StatelessWidget {
  final Color color;
  final double brightness;
  final String assetName;
  final int levelOfBrightness;

  const SvgMiniBulb({
    super.key,
    required this.color,
    required this.brightness,
    required this.levelOfBrightness,
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: brightness / 100,
      child: SvgPicture.asset(
        assetName,
        matchTextDirection: true,
        // fit: BoxFit.cover,
        width: 46,
        semanticsLabel: 'Light bulb',
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
