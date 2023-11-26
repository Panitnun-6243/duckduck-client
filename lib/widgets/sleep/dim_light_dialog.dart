import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class DimLightDialog extends StatefulWidget {
  const DimLightDialog({super.key});

  @override
  State<DimLightDialog> createState() => _DimLightDialogState();
}

class _DimLightDialogState extends State<DimLightDialog> {
  int selectedMinute = 1;

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (int value) {
        setState(() {
          selectedMinute = value + 1; // Adding 1 because the array starts at 0
        });
      },
      scrollController: FixedExtentScrollController(
        initialItem: selectedMinute - 1,
      ),
      children: List<Widget>.generate(60, (int index) {
        return Center(child: Text('${index + 1} minutes'));
      }),
    );
  }
}
