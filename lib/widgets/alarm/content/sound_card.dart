import 'package:duckduck/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:duckduck/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../../providers/alarm_provider.dart';

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
              Expanded(
                child: Column(
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
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlarmMusicSelector(dialogContext: context);
                            });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: DuckDuckColors.frostWhite,
                          foregroundColor: DuckDuckColors.steelBlack,
                          padding: const EdgeInsets.all(5.0),
                          textStyle: GoogleFonts.rubik(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          side: const BorderSide(
                              color: DuckDuckColors.duckyYellow, width: 1),
                          shadowColor: Colors.transparent),
                      child: Consumer<AlarmProvider>(
                        builder: (context, alarmProvider, _) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Text(
                                alarmProvider.currentAlarmSound,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right,
                              color: DuckDuckColors.duckyYellow,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
