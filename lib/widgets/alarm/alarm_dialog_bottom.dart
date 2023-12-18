import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'alarm_button.dart';

class AlarmDialogBottom extends StatelessWidget {
  final void Function() onSave;
  const AlarmDialogBottom({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    void handleCancelCreate() {
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
              'Confirm Cancel',
              style: GoogleFonts.rubik(
                color: DuckDuckStatus.error,
                fontWeight: FontWeight.w500,
              ),
            ),
            content: Text(
              'Are you sure you want to cancel to create new alarm?',
              style: GoogleFonts.rubik(
                color: DuckDuckColors.steelBlack,
              ),
            ),
            actions: [
              TextButton(
                child: Text(
                  'Cancel',
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
                  'Confirm',
                  style: GoogleFonts.rubik(
                    color: DuckDuckStatus.error,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                onPressed: () {
                  // Close the confirmation dialog
                  Navigator.of(dialogContext).pop();

                  // Navigate back from the AlarmDialog
                  Navigator.of(context).pop();
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
            label: 'Cancel',
            icon: null,
            backgroundColor: Colors.transparent,
            textColor: DuckDuckStatus.error,
            onPressed: () => handleCancelCreate(),
            fontWeight: FontWeight.w400,
          ),
          AlarmButton(
            label: 'Save',
            icon: Icons.check,
            fontWeight: FontWeight.w500,
            backgroundColor: DuckDuckColors.skyBlue,
            textColor: DuckDuckColors.frostWhite,
            onPressed: () {
              Navigator.of(context).pop();
              onSave();
            },
          ),
        ],
      ),
    );
  }
}
