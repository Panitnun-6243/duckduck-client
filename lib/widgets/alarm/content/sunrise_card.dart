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
  final TimeOfDay start;
  final TimeOfDay peak;
  final Function(String, TimeOfDay)? onChanged;
  final bool isEnabled;
  final Function(bool)? onToggle;
  const SunriseCard(
      {super.key,
      required this.start,
      required this.peak,
      this.onChanged,
      required this.isEnabled,
      this.onToggle});

  @override
  State<SunriseCard> createState() => _SunriseCardState();
}

class _SunriseCardState extends State<SunriseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310.00,
      height: widget.isEnabled ? 121.00 : 66,
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
                    AlarmSwitch(
                      onToggle: widget.onToggle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                widget.isEnabled
                    ? const Divider(
                        height: 1,
                        color: DuckDuckStatus.disabledForeground,
                      )
                    : const SizedBox(),
              ],
            ),
            widget.isEnabled
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TimePicker(
                              title: "Start",
                              image: "assets/images/sunrise_red.png",
                              time: widget.start,
                              onChanged: (newTime) {
                                widget.onChanged?.call("start", newTime);
                              }),
                          const SizedBox(
                            width: 10,
                          ),
                          TimePicker(
                              title: "Peak",
                              image: "assets/images/sun_blue.png",
                              time: widget.peak,
                              onChanged: (newTime) {
                                widget.onChanged?.call("peak", newTime);
                              }),
                        ],
                      )
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
