import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/alarm/alarm_repeat_alias.dart';
import 'package:duckduck/widgets/alarm/alarm_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/alarm.dart';

class AlarmCard extends StatelessWidget {
  final Alarm alarm;
  final Function() onTapEdit;
  final Function(bool) onToggle;
  const AlarmCard(
      {super.key,
      required this.alarm,
      required this.onTapEdit,
      required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapEdit();
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        // ignore: dead_code
        color: alarm.isActive.status
            ? DuckDuckColors.skyBlue
            : DuckDuckStatus.disabled,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 2,
        child: SizedBox(
          height: 137,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 5,
                  height: 30,
                  color: alarm.isActive.status
                      ? DuckDuckColors.caramelCheese
                      // ignore: dead_code
                      : DuckDuckStatus.disabledForeground,
                  margin: const EdgeInsets.only(right: 20, left: 5),
                ),
                //middle card
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        alarm.description,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: alarm.isActive.status
                              ? DuckDuckColors.frostWhite
                              // ignore: dead_code
                              : DuckDuckStatus.disabledForeground,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.bedtime,
                            color: alarm.isActive.status
                                ? DuckDuckColors.metalBlue
                                // ignore: dead_code
                                : DuckDuckStatus.disabledForeground,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            '${alarm.bedTime.hours.toString().padLeft(2, '0')}:${alarm.bedTime.minutes.toString().padLeft(2, '0')}',
                            style: GoogleFonts.rubik(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: alarm.isActive.status
                                  ? DuckDuckColors.frostWhite
                                  // ignore: dead_code
                                  : DuckDuckStatus.disabledForeground,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          alarm.repeatDays.length != 0
                              ? AlamRepeatAlias(
                                  alarm: alarm,
                                )
                              : const SizedBox(),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sunny,
                            color: alarm.isActive.status
                                ? DuckDuckColors.mandarinOrange
                                // ignore: dead_code
                                : DuckDuckStatus.disabledForeground,
                            size: 24,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${alarm.wakeUpTime.hours.toString().padLeft(2, '0')}:${alarm.wakeUpTime.minutes.toString().padLeft(2, '0')}',
                            style: GoogleFonts.rubik(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: alarm.isActive.status
                                  ? DuckDuckColors.frostWhite
                                  // ignore: dead_code
                                  : DuckDuckStatus.disabledForeground,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(
                            alarm.volume == 0
                                ? Icons.volume_off
                                : Icons.volume_up,
                            color: alarm.isActive.status
                                ? (alarm.volume == 0
                                    ? DuckDuckStatus.error
                                    : DuckDuckColors.frostWhite)
                                // ignore: dead_code
                                : DuckDuckStatus.disabledForeground,
                            size: 24,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                AlarmSwitch(
                  defaultState: alarm.isActive.status,
                  onToggle: onToggle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
