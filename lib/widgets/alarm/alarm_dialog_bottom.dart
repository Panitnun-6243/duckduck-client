import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'alarm_button.dart';

class AlarmDialogBottom extends StatelessWidget {
  const AlarmDialogBottom({super.key});

  @override
  Widget build(BuildContext context) {
    void handleDelete() {
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text(
              'Confirm Deletion',
              style: GoogleFonts.rubik(
                color: DuckDuckColors.cocoa,
                fontWeight: FontWeight.w400,
              ),
            ),
            content: Text(
              'Are you sure you want to delete this alarm?',
              style: GoogleFonts.rubik(
                color: DuckDuckColors.cocoa,
                fontWeight: FontWeight.w400,
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
                  'Delete',
                  style: GoogleFonts.rubik(
                    color: DuckDuckStatus.error,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                onPressed: () {
                  // Here you can call the method to delete the alarm
                  // ...

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
            label: 'Delete',
            icon: null,
            backgroundColor: Colors.transparent,
            textColor: DuckDuckStatus.error,
            onPressed: () => handleDelete(),
            fontWeight: FontWeight.w400,
          ),
          AlarmButton(
            label: 'Save',
            icon: Icons.check,
            fontWeight: FontWeight.w500,
            backgroundColor: DuckDuckColors.skyBlue,
            textColor: DuckDuckColors.frostWhite,
            onPressed: () => print('Save pressed'),
          ),
        ],
      ),
    );
  }
}
