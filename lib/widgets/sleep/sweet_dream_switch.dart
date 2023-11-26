import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class SweetDreamSwitch extends StatefulWidget {
  final bool? defaultState;
  final Function(bool)? onToggle;
  const SweetDreamSwitch({super.key, this.defaultState, this.onToggle});

  @override
  State<SweetDreamSwitch> createState() => _SweetDreamSwitchState();
}

class _SweetDreamSwitchState extends State<SweetDreamSwitch> {
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
