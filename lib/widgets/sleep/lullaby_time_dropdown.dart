import 'package:duckduck/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LullabyTimeDropdown extends StatelessWidget {
  const LullabyTimeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left_outlined),
                  onPressed: () {},
                  color: DuckDuckStatus.disabledForeground,
                  iconSize: 36,
                ),
                Text(
                  'Dim Light',
                  style: GoogleFonts.rubik(
                    fontSize: 20,
                    color: DuckDuckColors.steelBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
