import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/alarm/alarm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/alarm_provider.dart';
import 'alarm_button.dart';

class SoundDialogBottom extends StatelessWidget {
  const SoundDialogBottom({Key? key});

  @override
  Widget build(BuildContext context) {
    void handleCancel() {
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            shape: ShapeBorder.lerp(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              1,
            ),
            title: Text(
              'Cancel',
              style: GoogleFonts.rubik(
                color: DuckDuckStatus.error,
                fontWeight: FontWeight.w500,
              ),
            ),
            content: Text(
              'Cancel to change the sound?',
              style: GoogleFonts.rubik(
                color: DuckDuckColors.steelBlack,
              ),
            ),
            actions: [
              TextButton(
                child: Text(
                  'YES',
                  style: GoogleFonts.rubik(
                    color: DuckDuckColors.steelBlack,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(dialogContext).pop();
                },
              ),
              TextButton(
                child: Text(
                  'NO',
                  style: GoogleFonts.rubik(
                    color: DuckDuckColors.steelBlack,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                onPressed: () {
                  // Navigate back from the SoundDialogBottom
                  Navigator.of(dialogContext).pop();
                },
              ),
            ],
          );
        },
      );
    }

    void handleConfirm() {
      // Update current alarm sound only when Confirm is pressed
      Provider.of<AlarmProvider>(context, listen: false).setCurrentAlarmSound(
          Provider.of<AlarmProvider>(context, listen: false).currentAlarmSound,
          Provider.of<AlarmProvider>(context, listen: false)
              .currentAlarmSoundPath);

      // Update current alarm sound
      Navigator.of(context).pop();
    }

    return SizedBox(
      height: 75,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AlarmButton(
            label: 'Cancel',
            icon: null,
            backgroundColor: Colors.white10,
            textColor: const Color.fromARGB(0xFF, 0xCD, 0xCD, 0xCB),
            onPressed: () => handleCancel(),
            fontWeight: FontWeight.w400,
          ),
          Consumer<AlarmProvider>(
            builder: (context, alarmProvider, _) => AlarmButton(
              label: 'Confirm',
              icon: Icons.check,
              fontWeight: FontWeight.w500,
              backgroundColor: DuckDuckColors.duckyYellow,
              textColor: DuckDuckColors.cocoa,
              onPressed: () => handleConfirm(),
            ),
          ),
        ],
      ),
    );
  }
}
