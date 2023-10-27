import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeTextField extends StatelessWidget {
  const TimeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 38,
            height: 28,
            decoration: const BoxDecoration(
                color: Color.fromARGB(0xff, 0xf5, 0xf5, 0xf5),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Center(
              child: Text(
                '00',
                style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                        color: DuckDuckColors.steelBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ),
            )),
        SizedBox(
          width: 13,
          child: Center(
            child: Text(
              ':',
              style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                      color: DuckDuckColors.steelBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ),
        Container(
            width: 38,
            height: 28,
            decoration: const BoxDecoration(
                color: Color.fromARGB(0xff, 0xf5, 0xf5, 0xf5),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Center(
              child: Text(
                '00',
                style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                        color: DuckDuckColors.steelBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ),
            ))
      ],
    );
  }
}
