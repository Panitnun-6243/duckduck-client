import 'package:duckduck/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmSwitch extends StatefulWidget {
  final bool? defaultState;
  final Function(bool)? onToggle;
  const AlarmSwitch({super.key, this.defaultState, this.onToggle});

  @override
  State<AlarmSwitch> createState() => _AlarmSwitchState();
}

class _AlarmSwitchState extends State<AlarmSwitch> {
  late bool _switchValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _switchValue = widget.defaultState ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
        activeColor: DuckDuckColors.duckyYellow,
        value: _switchValue,
        onChanged: (value) {
          setState(() {
            _switchValue = !_switchValue;
          });
          widget.onToggle?.call(value);
        });
  }
}
