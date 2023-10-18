import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/alarm/alarm_repeat_alias.dart';
import 'package:duckduck/widgets/alarm/alarm_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlarmCard extends StatelessWidget {
  const AlarmCard({super.key});

  @override
  Widget build(BuildContext context) {
    int bedtimeHours = 7;
    int bedtimeMinutes = 30;
    int wakeUpHours = 21;
    int wakeUpMinutes = 30;
    int volume = 0;
    int repeatDaysCount = 0;
    bool isActive = true;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: isActive ? DuckDuckColors.skyBlue : DuckDuckStatus.disabled,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 2,
      child: SizedBox(
        height: 121,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 5,
                height: 30,
                color: isActive
                    ? DuckDuckColors.caramelCheese
                    : DuckDuckStatus.disabledForeground,
                margin: const EdgeInsets.only(right: 20, left: 5),
              ),
              //middle card
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wake up',
                      style: GoogleFonts.rubik(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: isActive
                            ? DuckDuckColors.frostWhite
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
                          color: isActive
                              ? DuckDuckColors.metalBlue
                              : DuckDuckStatus.disabledForeground,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          '$bedtimeHours:$bedtimeMinutes',
                          style: GoogleFonts.rubik(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: isActive
                                ? DuckDuckColors.frostWhite
                                : DuckDuckStatus.disabledForeground,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        repeatDaysCount != 0
                            ? const AlamRepeatAlias()
                            : const SizedBox(),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sunny,
                          color: isActive
                              ? DuckDuckColors.mandarinOrange
                              : DuckDuckStatus.disabledForeground,
                          size: 24,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '$wakeUpHours:$wakeUpMinutes',
                          style: GoogleFonts.rubik(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: isActive
                                ? DuckDuckColors.frostWhite
                                : DuckDuckStatus.disabledForeground,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          volume == 0 ? Icons.volume_off : Icons.volume_up,
                          color: isActive
                              ? (volume == 0
                                  ? DuckDuckStatus.error
                                  : DuckDuckColors.frostWhite)
                              : DuckDuckStatus.disabledForeground,
                          size: 24,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const AlarmSwitch(),
            ],
          ),
        ),
      ),
    );
  }
}
