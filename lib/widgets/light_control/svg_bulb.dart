import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgBulb extends StatelessWidget {
  final Color color;
  final double brightness;

  SvgBulb({required this.color, required this.brightness});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: brightness / 100, // Convert the brightness value from 0 to 1.
      child: SvgPicture.asset(
        'assets/images/light-bulb.svg',
        color: color,
      ),
    );
  }
}
