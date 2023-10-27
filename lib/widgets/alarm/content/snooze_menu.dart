import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const List<int> snoozeList = <int>[1, 2, 3, 4, 5, 10, 20, 30];

class SnoozeMenu extends StatefulWidget {
  const SnoozeMenu({super.key});

  @override
  State<SnoozeMenu> createState() => _SnoozeMenuState();
}

class _SnoozeMenuState extends State<SnoozeMenu> {
  int currentOption = snoozeList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 261,
        height: 36,
        child: DropdownButtonFormField<String>(
          validator: (value) => null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: snoozeList.first.toString(),
          decoration: const InputDecoration(
              fillColor: DuckDuckColors.frostWhite,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: DuckDuckColors.duckyYellow)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: DuckDuckColors.duckyYellow)),
              contentPadding: EdgeInsets.only(left: 16, right: 5)),
          icon: const Icon(Icons.keyboard_arrow_down,
              color: DuckDuckColors.duckyYellow),
          iconSize: 24,
          elevation: 16,
          isExpanded: false,
          onChanged: (String? newValue) {
            currentOption = int.parse(newValue ?? "1");
          },
          items: snoozeList
              .map((minutes) => minutes.toString())
              .map((option) => DropdownMenuItem(
                  value: option,
                  child: Text(
                    "$option minutes",
                    style: GoogleFonts.rubik(
                        color: DuckDuckColors.steelBlack, fontSize: 14),
                  )))
              .toList(),
        ));
  }
}
