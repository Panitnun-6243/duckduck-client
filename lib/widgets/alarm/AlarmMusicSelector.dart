import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/alarm/SoundRadioList.dart';
import 'package:duckduck/widgets/alarm/alarm_dialog_bottom.dart';
import 'package:duckduck/widgets/alarm/sound_dialog_bottom.dart';
import 'package:duckduck/widgets/confirm_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/alarm_sound.dart';
import '../../providers/alarm_provider.dart';
// import 'package:google_fonts/google_fonts.dart';

class AlarmMusicSelector extends StatefulWidget {
  final BuildContext dialogContext;
  const AlarmMusicSelector({super.key, required this.dialogContext});

  @override
  State<AlarmMusicSelector> createState() => _AlarmMusicSelectorState();
}

class _AlarmMusicSelectorState extends State<AlarmMusicSelector> {
  List<AlarmSound> presetSounds = []; // Add this line

  @override
  void initState() {
    super.initState();
    fetchPresetSounds(); // Add this line
  }

  Future<void> fetchPresetSounds() async {
    try {
      List<AlarmSound> sounds = await AlarmProvider().fetchPresetAlarmSounds();
      setState(() {
        presetSounds = sounds;
      });
    } catch (e) {
      print('Error fetching preset sounds: $e');
    }
  }

  int value = 0;
  String groupValue = "Classic";
  String groupValue2 = "Radial";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: DuckDuckColors.frostWhite,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: DuckDuckStatus.disabledForeground,
                            width: 0.7,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.chevron_left_outlined),
                            onPressed: () {
                              Navigator.pop(widget.dialogContext);
                            },
                            color: DuckDuckStatus.disabledForeground,
                            iconSize: 32,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Sound',
                            style: GoogleFonts.rubik(
                              fontSize: 18,
                              color: DuckDuckColors.steelBlack,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: DuckDuckStatus.disabledForeground,
                                      width: 0.7,
                                    ),
                                  ),
                                ),
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  'Preset',
                                  style: GoogleFonts.rubik(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: DuckDuckColors.steelBlack,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SoundRadioList(
                        presetSounds: presetSounds, // Pass the preset sounds
                        groupValue: groupValue2,
                        onChanged: (String newValue) {
                          setState(() {
                            groupValue2 = newValue;
                          });
                        },
                        // value: '',
                      ),
                    ],
                  ),
                ),
              ),
              SoundDialogBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
