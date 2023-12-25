import 'package:duckduck/providers/alarm_provider.dart';
import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/alarm.dart';

class AlamRepeatAlias extends StatefulWidget {
  final Alarm alarm;
  const AlamRepeatAlias({super.key, required this.alarm});

  @override
  State<AlamRepeatAlias> createState() => _AlamRepeatAliasState();
}

class _AlamRepeatAliasState extends State<AlamRepeatAlias> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.loop,
          color: widget.alarm.isActive.status
              ? DuckDuckColors.metalBlue
              : DuckDuckStatus.disabledForeground,
          size: 16,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          'S',
          style: GoogleFonts.rubik(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: widget.alarm.repeatDays.contains('sun')
                ? DuckDuckColors.frostWhite
                : const Color(0x33FDFEFD),
          ),
        ),
        const SizedBox(
          width: 3.2,
        ),
        Text(
          'M',
          style: GoogleFonts.rubik(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: widget.alarm.repeatDays.contains('mon')
                ? DuckDuckColors.frostWhite
                : const Color(0x33FDFEFD),
          ),
        ),
        const SizedBox(
          width: 3.2,
        ),
        Text(
          'T',
          style: GoogleFonts.rubik(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: widget.alarm.repeatDays.contains('tue')
                ? DuckDuckColors.frostWhite
                : const Color(0x33FDFEFD),
          ),
        ),
        const SizedBox(
          width: 3.2,
        ),
        Text(
          'W',
          style: GoogleFonts.rubik(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: widget.alarm.repeatDays.contains('wed')
                ? DuckDuckColors.frostWhite
                : const Color(0x33FDFEFD),
          ),
        ),
        const SizedBox(
          width: 3.2,
        ),
        Text(
          'T',
          style: GoogleFonts.rubik(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: widget.alarm.repeatDays.contains('thu')
                ? DuckDuckColors.frostWhite
                : const Color(0x33FDFEFD),
          ),
        ),
        const SizedBox(
          width: 3.2,
        ),
        Text(
          'F',
          style: GoogleFonts.rubik(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: widget.alarm.repeatDays.contains('fri')
                ? DuckDuckColors.frostWhite
                : const Color(0x33FDFEFD),
          ),
        ),
        const SizedBox(
          width: 3.2,
        ),
        Text(
          'S',
          style: GoogleFonts.rubik(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: widget.alarm.repeatDays.contains('sat')
                ? DuckDuckColors.frostWhite
                : const Color(0x33FDFEFD),
          ),
        ),
      ],
    );
  }
}
