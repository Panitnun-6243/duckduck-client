import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/alarm/content/TimePicker.dart';
import 'package:duckduck/widgets/alarm/content/TimeTextField.dart';
// import 'package:duckduck/widgets/alarm/alarm_dialog_bottom.dart';
// import 'package:duckduck/widgets/alarm/alarm_gauge.dart';
// import 'package:duckduck/widgets/alarm/alarm_header.dart';
// import 'package:duckduck/widgets/alarm/test_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SleepTime extends StatefulWidget {
  final TimeOfDay bedtime;
  final TimeOfDay wakeup;
  final Function(String, TimeOfDay)? onChanged;
  const SleepTime(
      {super.key, required this.bedtime, required this.wakeup, this.onChanged});

  @override
  State<SleepTime> createState() => _SleepTimeState();
}

class _SleepTimeState extends State<SleepTime> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(children: [
        TimePicker(
            icon: Icons.bedtime,
            iconColor: DuckDuckColors.metalBlue,
            title: "Bedtime",
            time: widget.bedtime,
            onChanged: (newTime) {
              widget.onChanged?.call("bedtime", newTime);
            }),
        const SizedBox(
          width: 30,
        ),
        TimePicker(
            icon: Icons.sunny,
            iconColor: DuckDuckColors.duckyYellow,
            title: "Wake up",
            time: widget.wakeup,
            onChanged: (newTime) {
              widget.onChanged?.call("wakeup", newTime);
            }),
      ])
    ]);
  }
}
