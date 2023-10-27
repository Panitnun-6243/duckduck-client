import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/alarm/alarm_dialog_bottom.dart';
import 'package:duckduck/widgets/alarm/alarm_gauge.dart';
import 'package:duckduck/widgets/alarm/alarm_header.dart';
import 'package:duckduck/widgets/alarm/alarm_switch.dart';
import 'package:duckduck/widgets/alarm/content/TimePicker.dart';
import 'package:duckduck/widgets/alarm/content/TimeTextField.dart';
import 'package:duckduck/widgets/alarm/test_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:duckduck/widgets/alarm/content/TimeTextField.dart';

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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    AlarmSwitch(),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TimePicker(
                        title: "Start", image: "assets/images/sunrise_red.png"),
                    SizedBox(
                      width: 30,
                    ),
                    TimePicker(
                      title: "End",
                      image: "assets/images/sun_blue.png",
                    ),
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
