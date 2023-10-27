import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayTile extends StatelessWidget {
  final bool isSelected;
  final String text;
  final Function()? onClick;
  const DayTile(
      {required this.text, this.isSelected = false, this.onClick, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onClick,
        child: Container(
            width: 48,
            height: 30,
            decoration: BoxDecoration(
                color: isSelected
                    ? DuckDuckColors.duckyYellow
                    : DuckDuckColors.frostWhite,
                border: Border.all(
                    color: isSelected
                        ? DuckDuckColors.duckyYellow
                        : DuckDuckStatus.disabledForeground),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(text,
                    style: GoogleFonts.rubik(
                        fontSize: 10,
                        color: isSelected
                            ? DuckDuckColors.frostWhite
                            : DuckDuckStatus.disabledForeground,
                        fontWeight:
                            isSelected ? FontWeight.w500 : FontWeight.w400)),
              ],
            )));
  }
}
