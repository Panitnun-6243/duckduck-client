import 'package:duckduck/widgets/alarm/alarm_dialog_bottom.dart';
import 'package:duckduck/widgets/alarm/alarm_gauge.dart';
import 'package:duckduck/widgets/alarm/alarm_header.dart';
import 'package:flutter/material.dart';
import 'package:duckduck/widgets/alarm/content/sleep_time.dart';
import 'package:duckduck/widgets/alarm/content/sunrise_card.dart';
import 'package:duckduck/widgets/alarm/content/repeat_card.dart';
import 'package:duckduck/widgets/alarm/content/sound_card.dart';
import 'package:duckduck/widgets/alarm/content/volume_card.dart';
import 'package:duckduck/widgets/alarm/content/snooze_card.dart';

const TimeOfDay DEFAULT_BEDTIME = TimeOfDay(hour: 22, minute: 0);
const TimeOfDay DEFAULT_WAKEUP = TimeOfDay(hour: 6, minute: 0);
const TimeOfDay DEFAULT_START = TimeOfDay(hour: 3, minute: 30);
const TimeOfDay DEFAULT_PEAK = TimeOfDay(hour: 5, minute: 30);

class AlarmDialog extends StatefulWidget {
  const AlarmDialog({super.key});

  @override
  State<AlarmDialog> createState() => _AlarmDialogState();
}

class _AlarmDialogState extends State<AlarmDialog> {
  var timeState = {
    "bedtime": DEFAULT_BEDTIME,
    "wakeup": DEFAULT_WAKEUP,
    "start": DEFAULT_START,
    "peak": DEFAULT_PEAK,
  };

  bool sunriseEnabled = true;
  bool isEditing = false;
  String alarmName = "New alarm";

  void updateTime(key, newTime) {
    setState(() {
      timeState[key] = newTime;
    });
  }

  void updateName(String newName) async {
    setState(() {
      alarmName = newName;
    });
  }

  void toggleSunrise(bool isEnabled) {
    setState(() {
      sunriseEnabled = isEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Container(
            child: Column(
              children: [
                AlarmHeader(
                  alarmName: alarmName,
                  isEditing: isEditing,
                  onToggle: (state) {
                    setState(() {
                      isEditing = state ?? false;
                    });
                  },
                  onChanged: updateName,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AlarmGauge(
                          updateTime: updateTime,
                        ),
                        // TestDialog(),
                        // Text('alarm content'),
                        SleepTime(
                          bedtime: timeState["bedtime"] ?? DEFAULT_BEDTIME,
                          wakeup: timeState["wakeup"] ?? DEFAULT_WAKEUP,
                          onChanged: updateTime,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SunriseCard(
                            start: timeState["start"] ?? DEFAULT_START,
                            peak: timeState["peak"] ?? DEFAULT_PEAK,
                            onChanged: updateTime,
                            isEnabled: sunriseEnabled,
                            onToggle: toggleSunrise),

                        const SizedBox(
                          height: 25,
                        ),
                        const RepeatCard(),
                        const SizedBox(
                          height: 25,
                        ),
                        const SoundCard(),
                        const SizedBox(
                          height: 25,
                        ),
                        const VoulmeCard(),
                        const SizedBox(
                          height: 25,
                        ),
                        const SnoozeCard(),
                        const SizedBox(height: 60)
                      ],
                    ),
                  ),
                ),
                const AlarmDialogBottom()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
