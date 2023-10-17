import 'package:flutter/material.dart';
import 'package:duckduck/utils/colors.dart';

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
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
