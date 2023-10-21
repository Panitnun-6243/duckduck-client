import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:duckduck/utils/colors.dart';

class WidgetCard extends StatelessWidget {
  const WidgetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 357,
          height: 107,
          // padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: DuckDuckColors.whippedCream,
            borderRadius: BorderRadius.circular(21.67),
            border: Border.all(
              color: DuckDuckColors.duckyYellow,
              width: 1.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: GoogleFonts.rubik(
                          fontSize: 21.62,
                          fontWeight: FontWeight.w600,
                          color: DuckDuckColors.cocoa,
                        ),
                        children: [
                           const TextSpan(text: 'Customize\n'),
                          const TextSpan(text: 'Widget'),
                        ]),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/images/Widget_icon.png',
                width: 67,
                height: 67,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
