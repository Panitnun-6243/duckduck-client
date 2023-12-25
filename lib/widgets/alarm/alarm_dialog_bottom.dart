import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'alarm_button.dart';

class AlarmDialogBottom extends StatelessWidget {
  final void Function(BuildContext) onPrimary;
  final void Function(BuildContext) onSecondary;
  final String primaryText;
  final String secondaryText;
  const AlarmDialogBottom(
      {super.key,
      required this.onPrimary,
      required this.onSecondary,
      this.primaryText = 'Save',
      this.secondaryText = 'Cancel'});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AlarmButton(
            label: secondaryText,
            icon: null,
            backgroundColor: Colors.transparent,
            textColor: DuckDuckStatus.error,
            onPressed: () {
              onSecondary(context);
            },
            fontWeight: FontWeight.w400,
          ),
          AlarmButton(
            label: primaryText,
            icon: Icons.check,
            fontWeight: FontWeight.w500,
            backgroundColor: DuckDuckColors.skyBlue,
            textColor: DuckDuckColors.frostWhite,
            onPressed: () {
              onPrimary(context);
            },
          ),
        ],
      ),
    );
  }
}
