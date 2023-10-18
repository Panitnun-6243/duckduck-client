import 'package:flutter/material.dart';
import 'package:duckduck/utils/colors.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 171.5,
          height: 109.00,
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
