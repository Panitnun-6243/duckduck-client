import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/alarm/alarm_dialog_bottom.dart';
import 'package:duckduck/widgets/alarm/alarm_gauge.dart';
import 'package:duckduck/widgets/alarm/alarm_header.dart';
import 'package:duckduck/widgets/alarm/test_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SleepTime extends StatefulWidget {
  const SleepTime({super.key});

  @override
  State<SleepTime> createState() => _SleepTimeState();
}

class _SleepTimeState extends State<SleepTime> {
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 136.00,
            height: 57.00,
            color: DuckDuckColors.duckyYellow,
            child: Row(
              children: [
                const Icon(
                  Icons.nightlight_round,
                  color: DuckDuckColors.metalBlue,
                  size: 36,
                ),
                Column(
                  children: [
                    Text(
                      'Bedtime',
                      style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: DuckDuckColors.steelBlack),
                    ),
                    const TextField(),
                  ],
                )
              ],
            ),
          ),
        ),
        // Container(
        //   width: 136.00,
        //   height: 57.00,
        //   color: DuckDuckColors.skyBlue,
        //   child: Row(
        //     children: [
        //       const Icon(
        //         Icons.sunny,
        //         color: DuckDuckColors.duckyYellow,
        //         size: 36,
        //       ),
        //       Column(
        //         children: [
        //           Text(
        //             'Wake up',
        //             style: GoogleFonts.rubik(
        //                 fontSize: 16, fontWeight: FontWeight.w500),
        //           )
        //         ],
        //       )
        //     ],
        //   ),
        // )
      ],
    );
  }
}
