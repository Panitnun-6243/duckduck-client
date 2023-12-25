import 'package:flutter/material.dart';
import 'package:duckduck/utils/colors.dart';
import 'package:flutter/cupertino.dart';

class VolumeSlider extends StatefulWidget {
  final double startValue;
  final void Function(double) onChanged;
  const VolumeSlider(
      {super.key, required this.startValue, required this.onChanged});

  @override
  State<VolumeSlider> createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  // late double volume;

  @override
  void initState() {
    super.initState();
    // volume = widget.startValue;
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: widget.startValue,
      min: 0.0,
      max: 100.0,
      activeColor: DuckDuckColors.duckyYellow,
      thumbColor: DuckDuckColors.frostWhite,
      inactiveColor: DuckDuckStatus.disabled,
      onChanged: (double value) {
        // setState(() {
        //   volume = value;
        // });
        widget.onChanged(value);
      },
    );
  }
}
