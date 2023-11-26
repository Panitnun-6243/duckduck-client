import 'package:duckduck/pages/pages.dart';
import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/sleep/dim_light_chooser.dart';
import 'package:duckduck/widgets/sleep/lullaby_chooser.dart';
import 'package:duckduck/widgets/sleep/sweet_dream_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../chooser.dart';

class SweetDreams extends StatelessWidget {
  const SweetDreams({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: DuckDuckColors.whippedCream,
        border: Border.all(
            strokeAlign: BorderSide.strokeAlignInside,
            width: 1,
            color: DuckDuckColors.duckyYellow),
      ),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Sweet Dreams',
                style: GoogleFonts.rubik(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: DuckDuckColors.cocoa),
              ),
              SweetDreamSwitch()
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chooser(
                title: 'Dim Light',
                icon: Icons.wb_sunny_outlined,
                onTapped: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DimLightPage()),
                  );
                },
              ),
              const SizedBox(
                height: 8,
              ),
              Chooser(
                title: 'Lullaby',
                icon: Icons.music_note_outlined,
                onTapped: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LullabySongPage(),
                      ));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
