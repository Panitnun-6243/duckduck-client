import 'package:duckduck/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmSwitch extends StatefulWidget {
  const AlarmSwitch({super.key});

  @override
  State<AlarmSwitch> createState() => _AlarmSwitchState();
}

class _AlarmSwitchState extends State<AlarmSwitch> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
        activeColor: DuckDuckColors.duckyYellow,
        value: _switchValue,
        onChanged: (value) {
          setState(() {
            _switchValue = !_switchValue;
          });
        });
  }
}
