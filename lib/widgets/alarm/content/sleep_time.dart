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
  const SleepTime({super.key});

  @override
  State<SleepTime> createState() => _SleepTimeState();
}

class _SleepTimeState extends State<SleepTime> {
  @override
  Widget build(BuildContext context) {
    return const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(children: [
        TimePicker(
            icon: Icons.bedtime,
            iconColor: DuckDuckColors.metalBlue,
            title: "Bedtime"),
        SizedBox(
          width: 30,
        ),
        TimePicker(
          icon: Icons.sunny,
          iconColor: DuckDuckColors.duckyYellow,
          title: "Wake up",
        ),
      ])
    ]);
  }
}
