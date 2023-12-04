import 'package:duckduck/pages/pages.dart';
import 'package:duckduck/utils/colors.dart';
import 'package:duckduck/widgets/sleep/sweet_dream_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/sleep_provider.dart';
import '../chooser.dart';

class SweetDreams extends StatelessWidget {
  const SweetDreams({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SleepProvider>(builder: (context, provider, child) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: provider.dimLight.isActive
              ? DuckDuckColors.whippedCream
              : DuckDuckStatus.disabled,
          border: Border.all(
              strokeAlign: BorderSide.strokeAlignInside,
              width: 1,
              color: provider.dimLight.isActive
                  ? DuckDuckColors.duckyYellow
                  : DuckDuckStatus.disabledForeground),
        ),
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
            bottom: provider.dimLight.isActive ? 20 : 5),
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
                      color: provider.dimLight.isActive
                          ? DuckDuckColors.cocoa
                          : Colors.grey),
                ),
                const SweetDreamSwitch()
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Chooser(
                  title: 'Dim Light',
                  icon: Icons.wb_sunny_outlined,
                  onTapped: () {
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return _buildContainer(const DimLightDialog(), context);
                      },
                    );
                  },
                ),
                provider.dimLight.isActive
                    ? Row(
                        children: [
                          Text(
                            'Duration:',
                            style: GoogleFonts.rubik(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: provider.dimLight.isActive
                                  ? DuckDuckColors.cocoa
                                  : Colors.grey,
                            ),
                          ),
                          Text(
                            ' ${provider.dimLight.duration} minutes',
                            style: GoogleFonts.rubik(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: provider.dimLight.isActive
                                  ? DuckDuckColors.cocoa
                                  : Colors.grey,
                            ),
                          )
                        ],
                      )
                    : Container(),
                provider.dimLight.isActive
                    ? const SizedBox(
                        height: 13,
                      )
                    : Container(),
                Chooser(
                  title: 'Lullaby',
                  icon: Icons.music_note_outlined,
                  onTapped: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LullabySongPage(),
                      ),
                    );
                  },
                ),
                provider.dimLight.isActive
                    ? Row(
                        children: [
                          Text(
                            'Current Song:',
                            style: GoogleFonts.rubik(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: provider.dimLight.isActive
                                  ? DuckDuckColors.cocoa
                                  : Colors.grey,
                            ),
                          ),
                          Text(
                            ' ${provider.currentSong?.name ?? 'None'}',
                            style: GoogleFonts.rubik(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: provider.dimLight.isActive
                                  ? DuckDuckColors.cocoa
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ],
            )
          ],
        ),
      );
    });
  }
}

Widget _buildContainer(Widget picker, context) {
  return Container(
    height: 200,
    padding: const EdgeInsets.only(top: 6.0),
    color: CupertinoColors.white,
    child: DefaultTextStyle(
      style: const TextStyle(
        color: CupertinoColors.black,
        fontSize: 22.0,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SafeArea(
          top: false,
          child: picker,
        ),
      ),
    ),
  );
}
