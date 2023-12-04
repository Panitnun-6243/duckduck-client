import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/sleep_provider.dart';
import '../../utils/colors.dart';

class SweetDreamSwitch extends StatefulWidget {
  final bool? defaultState;
  final Function(bool)? onToggle;
  const SweetDreamSwitch({super.key, this.defaultState, this.onToggle});

  @override
  State<SweetDreamSwitch> createState() => _SweetDreamSwitchState();
}

class _SweetDreamSwitchState extends State<SweetDreamSwitch> {
  @override
  Widget build(BuildContext context) {
    final sleepProvider = Provider.of<SleepProvider>(context);

    return CupertinoSwitch(
      activeColor: DuckDuckColors.duckyYellow,
      value: sleepProvider.dimLight.isActive,
      onChanged: (bool value) {
        sleepProvider.setDimLight(value, sleepProvider.dimLight.duration);
      },
    );
  }
}
