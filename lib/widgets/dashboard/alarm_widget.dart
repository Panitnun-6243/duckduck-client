import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlarmWidget extends StatelessWidget {
  const AlarmWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 120.00,
          width: 120.00,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: DuckDuckColors.metalBlue,
            borderRadius: BorderRadius.circular(21.67),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          height: 120,
          width: 232,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: DuckDuckColors.frostWhite,
            borderRadius: BorderRadius.circular(21.67),
            border: Border.all(
              color: DuckDuckColors.metalBlue,
              width: 1.0,
            ),
          ),
        )
      ],
    );
  }
}
