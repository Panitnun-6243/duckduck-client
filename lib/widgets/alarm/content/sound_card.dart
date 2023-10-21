import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:duckduck/utils/colors.dart';

class SoundCard extends StatefulWidget {
  const SoundCard({super.key});

  @override
  State<SoundCard> createState() => _SoundCardState();
}

class _SoundCardState extends State<SoundCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(1.0),
                child: Icon(
                  Icons.music_note,
                  size: 36,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sound',
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: DuckDuckColors.steelBlack,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: DuckDuckColors.frostWhite,
                          onPrimary: DuckDuckColors.steelBlack,
                          padding: const EdgeInsets.all(5.0),
                          textStyle: GoogleFonts.rubik(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          fixedSize: const Size(261, 36),
                          side: const BorderSide(
                              color: DuckDuckColors.duckyYellow, width: 1)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Over the Horizon'),
                          SizedBox(
                            width: 12,
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: DuckDuckColors.duckyYellow,
                          )
                        ],
                      )),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
