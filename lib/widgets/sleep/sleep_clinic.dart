import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SleepClinicPage extends StatelessWidget {
  const SleepClinicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left_outlined),
                onPressed: () {
                  // Navigator.pop(widget.dialogContext);
                },
                color: DuckDuckStatus.disabledForeground,
                iconSize: 36,
              ),
              Text(
                'Sleep Clinic',
                style: GoogleFonts.rubik(
                  fontSize: 20,
                  color: DuckDuckColors.steelBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
