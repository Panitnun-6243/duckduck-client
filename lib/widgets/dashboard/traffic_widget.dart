import 'package:flutter/material.dart';
import 'package:duckduck/utils/colors.dart';

class TrafficWidget extends StatefulWidget {
  const TrafficWidget({super.key});

  @override
  State<TrafficWidget> createState() => _TrafficWidgetState();
}

class _TrafficWidgetState extends State<TrafficWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.00,
      height: 120.00,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DuckDuckColors.caramelCheese,
        borderRadius: BorderRadius.circular(21.67),
      ),
    );
  }
}
