import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/alarm/alarm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'alarm_button.dart';

class SoundDialogBottom extends StatelessWidget {
  const SoundDialogBottom({super.key});

  @override
  Widget build(BuildContext context) {
    void handleDelete() {
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
              'Cancle',
              style: GoogleFonts.rubik(
                color: DuckDuckStatus.error,
                fontWeight: FontWeight.w500,
              ),
            ),
            content: Text(
              'Cancle to use this sound?',
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
                  Navigator.of(dialogContext).pop(); // Close the dialog
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
                  // Method to delete the alarm

                  // Close the confirmation dialog
                  Navigator.of(context).pop();

                  // Navigate back from the AlarmDialog
                  Navigator.of(dialogContext).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return SizedBox(
      height: 75,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AlarmButton(
            label: 'Cancle',
            icon: null,
            backgroundColor: Colors.white10,
            textColor: Color.fromARGB(0xFF, 0xCD, 0xCD, 0xCB),
            onPressed: () => handleDelete(),
            fontWeight: FontWeight.w400,
          ),
          AlarmButton(
            label: 'Confirm',
            icon: Icons.check,
            fontWeight: FontWeight.w500,
            backgroundColor: DuckDuckColors.duckyYellow,
            textColor: DuckDuckColors.cocoa,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
