import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlamRepeatAlias extends StatefulWidget {
  const AlamRepeatAlias({super.key});

  @override
  State<AlamRepeatAlias> createState() => _AlamRepeatAliasState();
}

class _AlamRepeatAliasState extends State<AlamRepeatAlias> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.loop,
          color: DuckDuckColors.metalBlue,
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
            color: const Color(0x33FDFEFD),
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
            color: DuckDuckColors.frostWhite,
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
            color: const Color(0x33FDFEFD),
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
            color: const Color(0x33FDFEFD),
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
            color: DuckDuckColors.frostWhite,
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
            color: DuckDuckColors.frostWhite,
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
            color: DuckDuckColors.frostWhite,
          ),
        ),
      ],
    );
  }
}
