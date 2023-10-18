import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

import '../../utils/colors.dart';

class AlarmAddButton extends StatefulWidget {
  const AlarmAddButton({super.key});

  @override
  State<AlarmAddButton> createState() => _AlarmAddButtonState();
}

class _AlarmAddButtonState extends State<AlarmAddButton> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: const Color.fromRGBO(241, 250, 254, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: const DashedBorder.fromBorderSide(
              dashLength: 10,
              side: BorderSide(
                color: DuckDuckColors.skyBlue,
                width: 3,
                strokeAlign: BorderSide.strokeAlignInside,
              )),
        ),
        height: 121,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add,
                color: DuckDuckColors.skyBlue,
                size: 38,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                'Add',
                style: GoogleFonts.rubik(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: DuckDuckColors.skyBlue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
