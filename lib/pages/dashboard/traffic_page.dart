import 'package:flutter/material.dart';
import 'package:duckduck/utils/colors.dart';

class TrafficPage extends StatefulWidget {
  const TrafficPage({super.key});

  @override
  State<TrafficPage> createState() => _TrafficPageState();
}

class _TrafficPageState extends State<TrafficPage> {
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
