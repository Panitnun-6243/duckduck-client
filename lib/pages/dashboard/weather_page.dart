import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 171.5,
          height: 102,
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
