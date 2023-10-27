import 'package:flutter/material.dart';
import 'package:duckduck/utils/colors.dart';
import 'package:flutter/cupertino.dart';

class VolumeSlider extends StatefulWidget {
  const VolumeSlider({super.key});

  @override
  State<VolumeSlider> createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  double volumeLevel = 60;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: volumeLevel,
      min: 0.0,
      max: 100.0,
      activeColor: DuckDuckColors.duckyYellow,
      thumbColor: DuckDuckColors.frostWhite,
      inactiveColor: DuckDuckStatus.disabled,
      onChanged: (double value) {
        setState(() {
          volumeLevel = value;
        });
      },
    );
  }
}
