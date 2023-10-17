import 'package:flutter/material.dart';
import 'package:duckduck/utils/colors.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 171.5,
          height: 102,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: DuckDuckColors.caramelCheese,
            borderRadius: BorderRadius.circular(21.67),
          ),
        )
      ],
    );
  }
}
