import 'package:duckduck/providers/light_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SvgBulb extends StatelessWidget {
  final Color color;
  final double brightness;
  const SvgBulb({super.key, required this.color, required this.brightness});

  @override
  Widget build(BuildContext context) {
    print("bulb $color $brightness");
    return Opacity(
      opacity: brightness / 100,
      child: SvgPicture.asset(
        'assets/images/light-bulb-nofilter.svg',
        semanticsLabel: 'Light bulb',
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
