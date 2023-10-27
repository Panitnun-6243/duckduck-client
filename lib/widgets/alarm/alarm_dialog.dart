import 'package:duckduck/widgets/alarm/alarm_dialog_bottom.dart';
import 'package:duckduck/widgets/alarm/alarm_gauge.dart';
import 'package:duckduck/widgets/alarm/alarm_header.dart';
import 'package:duckduck/widgets/alarm/test_dialog.dart';
import 'package:flutter/material.dart';
import 'package:duckduck/widgets/alarm/content/sleep_time.dart';
import 'package:duckduck/widgets/alarm/content/sunrise_card.dart';
import 'package:duckduck/widgets/alarm/content/repeat_card.dart';
import 'package:duckduck/widgets/alarm/content/sound_card.dart';
import 'package:duckduck/widgets/alarm/content/volume_card.dart';
import 'package:duckduck/widgets/alarm/content/snooze_card.dart';

class AlarmDialog extends StatefulWidget {
  const AlarmDialog({super.key});

  @override
  State<AlarmDialog> createState() => _AlarmDialogState();
}

class _AlarmDialogState extends State<AlarmDialog> {
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
            child: const Column(
              children: [
                AlarmHeader(),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AlarmGauge(),
                        // TestDialog(),
                        // Text('alarm content'),
                        SleepTime(),
                        SizedBox(
                          height: 25,
                        ),
                        SunriseCard(),
                        SizedBox(
                          height: 25,
                        ),
                        RepeatCard(),
                        SizedBox(
                          height: 25,
                        ),
                        SoundCard(),
                        SizedBox(
                          height: 25,
                        ),
                        VoulmeCard(),
                        SizedBox(
                          height: 25,
                        ),
                        SnoozeCard(),
                        SizedBox(height: 60)
                      ],
                    ),
                  ),
                ),
                AlarmDialogBottom()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
