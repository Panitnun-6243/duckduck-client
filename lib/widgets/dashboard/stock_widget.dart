import 'package:flutter/material.dart';
import 'package:duckduck/utils/colors.dart';

class StockWidget extends StatefulWidget {
  const StockWidget({super.key});

  @override
  State<StockWidget> createState() => _StockWidgetState();
}

class _StockWidgetState extends State<StockWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 232,
          height: 120,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: DuckDuckColors.steelBlack,
            borderRadius: BorderRadius.circular(21.67),
          ),
        )
      ],
    );
    ;
  }
}
