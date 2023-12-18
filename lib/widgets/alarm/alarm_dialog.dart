import 'package:duckduck/utils/colors.dart';
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
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/alarm.dart';
import '../../models/alarm_sound.dart';
import '../../providers/alarm_provider.dart';

const TimeOfDay DEFAULT_BEDTIME = TimeOfDay(hour: 22, minute: 0);
const TimeOfDay DEFAULT_WAKEUP = TimeOfDay(hour: 6, minute: 0);
const TimeOfDay DEFAULT_START = TimeOfDay(hour: 3, minute: 30);
const TimeOfDay DEFAULT_PEAK = TimeOfDay(hour: 5, minute: 30);

class AlarmDialog extends StatefulWidget {
  final Alarm? initialAlarm;
  const AlarmDialog({super.key, this.initialAlarm});

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
  double volume = 100.0;

  List<bool> selectedRepeatDays = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<String> repeatDaysStr = [];
  int snoozeDuration = 1;
  List<AlarmSound>? presetAlarmSounds;
  void updateTime(key, newTime) {
    setState(
      () {
        timeState[key] = newTime;
      },
    );
  }

  Map<String, Map<String, int>> timeStateInt = {
    "bedtime": {},
    "wakeup": {},
    "start": {},
    "peak": {},
  };

  // Function to map TimeOfDay to hour and minute
  Map<String, int> mapTimeToHourMinute(TimeOfDay time) {
    return {
      "hours": time.hour,
      "minutes": time.minute,
    };
  }

  void updateName(String newName) async {
    setState(
      () {
        alarmName = newName;
      },
    );
  }

  void updateVolume(double newVolume) {
    setState(
      () {
        volume = newVolume;
      },
    );
  }

  void updateRepeatDays(List<bool> repeatDays) {
    setState(() {
      print(repeatDays);
      repeatDaysStr = days
          .where((day) => repeatDays[days.indexOf(day)] == true ? true : false)
          .toList();
      // to lowercase
      repeatDaysStr = repeatDaysStr.map((day) => day.toLowerCase()).toList();
      print(repeatDaysStr);
      selectedRepeatDays = repeatDays;
    });
  }

  // update snooze duration
  void updateSnoozeDuration(int duration) {
    setState(() {
      print(duration);
      snoozeDuration = duration;
    });
  }

  void toggleSunrise(bool isEnabled) {
    setState(
      () {
        sunriseEnabled = isEnabled;
      },
    );
  }

  bool validateAndSave() {
    return true;
  }

  Alarm getNewAlarm(context) {
    final currentAlarmSound =
        Provider.of<AlarmProvider>(context, listen: false).currentAlarmSound;
    final currentAlarmSoundPath =
        Provider.of<AlarmProvider>(context, listen: false)
            .currentAlarmSoundPath;

    print('saving $alarmName');
    print('saving $volume');
    print('saving $selectedRepeatDays ');
    print('saving $repeatDaysStr');
    print('saving $snoozeDuration');
    print('saving $timeState');
    timeState.forEach((key, value) {
      timeStateInt[key] = mapTimeToHourMinute(value);
    });

    print('saving ${timeStateInt["bedtime"]}');
    print('saving ${timeStateInt["wakeup"]}');
    print('saving ${timeStateInt["start"]}');
    print('saving ${timeStateInt["peak"]}');

    return Alarm(
      bedTime: TimeModel(
        hours: timeStateInt['bedtime']!['hours']!,
        minutes: timeStateInt['bedtime']!['minutes']!,
      ),
      wakeUpTime: TimeModel(
        hours: timeStateInt['wakeup']!['hours']!,
        minutes: timeStateInt['wakeup']!['minutes']!,
      ),
      description: alarmName,
      isActive: ActiveStatus(
        status: true,
        dateActive: DateTime.now(),
      ),
      repeatDays: repeatDaysStr,
      sunrise: Sunrise(
        startTime: TimeModel(
          hours: timeStateInt['start']!['hours']!,
          minutes: timeStateInt['start']!['minutes']!,
        ),
        peakTime: TimeModel(
          hours: timeStateInt['peak']!['hours']!,
          minutes: timeStateInt['peak']!['minutes']!,
        ),
      ),
      currentAlarmSound: currentAlarmSound, // Use the dynamic sound value
      currentAlarmSoundPath: currentAlarmSoundPath,
      volume: volume,
      snoozeTime: snoozeDuration,
    );
  }

  void submitAddAlarm(context) {
    final newAlarm = getNewAlarm(context);
    // Add the new alarm using the provider
    Provider.of<AlarmProvider>(context, listen: false).addAlarm(newAlarm);
    Navigator.of(context).pop();
  }

  void submitUpdateAlarm(context) {
    final newAlarm = getNewAlarm(context);
    Provider.of<AlarmProvider>(context, listen: false)
        .updateAlarm(widget.initialAlarm!.id!, newAlarm);
    Navigator.of(context).pop();
  }

  void submitDeleteAlarm(context) {
    Provider.of<AlarmProvider>(context, listen: false)
        .deleteAlarm(widget.initialAlarm!.id!);
    return;
  }

  void showConfirmDialog(context, [action]) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: ShapeBorder.lerp(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            1,
          ),
          title: Text(
            'Confirm Cancel',
            style: GoogleFonts.rubik(
              color: DuckDuckStatus.error,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: Text(
            'Are you sure you want to cancel to create new alarm?',
            style: GoogleFonts.rubik(
              color: DuckDuckColors.steelBlack,
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: GoogleFonts.rubik(
                  color: DuckDuckColors.steelBlack,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
            TextButton(
              child: Text(
                'Confirm',
                style: GoogleFonts.rubik(
                  color: DuckDuckStatus.error,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              onPressed: () {
                // Close the confirmation dialog
                Navigator.of(dialogContext).pop();

                // Navigate back from the AlarmDialog
                Navigator.of(context).pop();
                action?.call(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    print("dialog ${widget.initialAlarm == null}");

    if (widget.initialAlarm != null) {
      // Extract and set initial values from widget.initialAlarm
      alarmName = widget.initialAlarm!.description;
      volume = widget.initialAlarm!.volume;

      // Set other initial values accordingly
      timeState["bedtime"] = TimeOfDay(
        hour: widget.initialAlarm!.bedTime.hours,
        minute: widget.initialAlarm!.bedTime.minutes,
      );

      timeState["wakeup"] = TimeOfDay(
        hour: widget.initialAlarm!.wakeUpTime.hours,
        minute: widget.initialAlarm!.wakeUpTime.minutes,
      );

      timeState["start"] = TimeOfDay(
        hour: widget.initialAlarm!.sunrise.startTime.hours,
        minute: widget.initialAlarm!.sunrise.startTime.minutes,
      );

      timeState["peak"] = TimeOfDay(
        hour: widget.initialAlarm!.sunrise.peakTime.hours,
        minute: widget.initialAlarm!.sunrise.peakTime.minutes,
      );

      selectedRepeatDays = List<bool>.filled(7, false);
      for (String day in widget.initialAlarm!.repeatDays) {
        final index = days.indexOf(day);
        if (index != -1) {
          selectedRepeatDays[index] = true;
        }
      }

      snoozeDuration = widget.initialAlarm!.snoozeTime ?? 1;
    }

    // Fetch preset alarm sounds when the dialog is initialized
    fetchPresetAlarmSounds();
    setInitialSoundValues();
  }

  void setInitialSoundValues() {
    if (presetAlarmSounds != null && presetAlarmSounds!.isNotEmpty) {
      AlarmSound firstSound = presetAlarmSounds![0];
      Provider.of<AlarmProvider>(context, listen: false)
          .setCurrentAlarmSound(firstSound.name, firstSound.path);
    }
  }

  Future<void> fetchPresetAlarmSounds() async {
    try {
      final sounds = await Provider.of<AlarmProvider>(context, listen: false)
          .fetchPresetAlarmSounds();
      setState(() {
        presetAlarmSounds = sounds;
      });
    } catch (e) {
      print('Error fetching preset alarm sounds: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Dialog(
        backgroundColor: Color(0xffFFFFFF),
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
                        RepeatCard(
                          onRepeatChanged: updateRepeatDays,
                          initialSelectedDays: selectedRepeatDays,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const SoundCard(),
                        const SizedBox(
                          height: 25,
                        ),
                        VoulmeCard(volume: volume, onChanged: updateVolume),
                        const SizedBox(
                          height: 25,
                        ),
                        // SnoozeCard(
                        //   initialDuration: snoozeDuration,
                        //   onDurationChanged: updateSnoozeDuration,
                        // ),
                        const SizedBox(height: 60)
                      ],
                    ),
                  ),
                ),
                AlarmDialogBottom(
                  onPrimary: widget.initialAlarm != null
                      ? submitUpdateAlarm
                      : submitAddAlarm,
                  onSecondary: widget.initialAlarm != null
                      ? (context) =>
                          showConfirmDialog(context, submitDeleteAlarm)
                      : (context) => showConfirmDialog(context),
                  primaryText: widget.initialAlarm != null ? 'Update' : 'Save',
                  secondaryText:
                      widget.initialAlarm != null ? 'Delete' : 'Cancel',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
