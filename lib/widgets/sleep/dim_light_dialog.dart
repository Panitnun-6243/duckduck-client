import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/sleep_provider.dart';
import '../../utils/colors.dart';

class DimLightDialog extends StatefulWidget {
  const DimLightDialog({super.key});

  @override
  State<DimLightDialog> createState() => _DimLightDialogState();
}

class _DimLightDialogState extends State<DimLightDialog> {
  late int selectedMinute;

  @override
  void initState() {
    super.initState();
    final sleepProvider = Provider.of<SleepProvider>(context, listen: false);
    selectedMinute = sleepProvider.dimLight.duration;
  }

  @override
  Widget build(BuildContext context) {
    final sleepProvider = Provider.of<SleepProvider>(context, listen: false);

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (int value) async {
        sleepProvider.setDimLight(sleepProvider.dimLight.isActive, value + 1);
        await sleepProvider.updateSleepClinicData();
      },
      scrollController: FixedExtentScrollController(
        initialItem: selectedMinute - 1,
      ),
      children: List<Widget>.generate(
        60,
        (int index) {
          return Center(
            child: Text(
              '${index + 1} minutes',
              style: GoogleFonts.rubik(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: DuckDuckColors.frostWhite),
            ),
          );
        },
      ),
    );
  }
}
