import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/alarm_sound.dart';
import '../../utils/colors.dart';
import '../../providers/alarm_provider.dart'; // Import the AlarmProvider

class SoundRadioList extends StatefulWidget {
  final List<AlarmSound> presetSounds;
  final String groupValue;
  final Function onChanged;

  const SoundRadioList({
    Key? key,
    required this.groupValue,
    required this.onChanged,
    required this.presetSounds,
  }) : super(key: key);

  @override
  State<SoundRadioList> createState() => _SoundRadioListState();
}

class _SoundRadioListState extends State<SoundRadioList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.presetSounds.map((sound) {
        return RadioListTile<String>(
          title: Text(
            sound.name,
            style: GoogleFonts.rubik(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: DuckDuckColors.steelBlack,
            ),
          ),
          value: sound.id,
          groupValue: widget.groupValue,
          controlAffinity: ListTileControlAffinity.trailing,
          onChanged: (String? newValue) {
            widget.onChanged(newValue ?? "");
            // Update the current alarm sound in AlarmProvider
            Provider.of<AlarmProvider>(context, listen: false)
                .setCurrentAlarmSound(sound.name, sound.path);
          },
        );
      }).toList(),
    );
  }
}
