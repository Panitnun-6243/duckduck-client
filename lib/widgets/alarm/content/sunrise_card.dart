import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/alarm/alarm_dialog_bottom.dart';
import 'package:duckduck/widgets/alarm/alarm_gauge.dart';
import 'package:duckduck/widgets/alarm/alarm_header.dart';
import 'package:duckduck/widgets/alarm/test_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SunriseCard extends StatefulWidget {
  const SunriseCard({super.key});

  @override
  State<SunriseCard> createState() => _SunriseCardState();
}

class _SunriseCardState extends State<SunriseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310.00,
      height: 121.00,
      decoration: BoxDecoration(
        color: DuckDuckColors.whippedCream,
        borderRadius: BorderRadiusDirectional.circular(10.0),
        border: Border.all(
          color: DuckDuckColors.caramelCheese,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Sunrise',
                      style: GoogleFonts.rubik(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: DuckDuckColors.steelBlack),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  height: 1,
                  color: DuckDuckStatus.disabledForeground,
                ),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/sunrise_red.png',
                      width: 36.00,
                      height: 36.00,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          'Start',
                          style: GoogleFonts.rubik(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/sun_blue.png',
                      width: 36,
                      height: 36,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          'Peak',
                          style: GoogleFonts.rubik(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
