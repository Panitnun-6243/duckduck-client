import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 171.5,
          height: 109.00,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: DuckDuckColors.skyBlue,
            borderRadius: BorderRadius.circular(21.67),
          ),
        )
      ],
    );
  }
}
