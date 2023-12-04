import 'package:duckduck/providers/sleep_provider.dart';
import 'package:duckduck/widgets/sleep/lullaby_item.dart';
import 'package:duckduck/widgets/sleep/upload_mp3_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';

class LullabySongPage extends StatefulWidget {
  const LullabySongPage({super.key});

  @override
  State<LullabySongPage> createState() => _LullabySongPageState();
}

class _LullabySongPageState extends State<LullabySongPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<SleepProvider>(context, listen: false).fetchAllSongs();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Consumer<SleepProvider>(builder: (context, provider, child) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Lullaby',
                  style: GoogleFonts.rubik(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: DuckDuckColors.steelBlack),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LullabyItem(
                            category: 'Instrument',
                            numOfSongs:
                                provider.countSongsByCategory('instrument'),
                            image: 'assets/images/instrument.png',
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/lullaby-instrument');
                            },
                          ),
                          LullabyItem(
                            category: 'Ambient',
                            numOfSongs: provider.countSongsByCategory('noice'),
                            image: 'assets/images/ambient.png',
                            onTap: () {
                              Navigator.pushNamed(context, '/lullaby-ambient');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LullabyItem(
                            category: 'Natural',
                            numOfSongs:
                                provider.countSongsByCategory('natural'),
                            image: 'assets/images/natural.png',
                            onTap: () {
                              Navigator.pushNamed(context, '/lullaby-natural');
                            },
                          ),
                          LullabyItem(
                            category: 'Custom',
                            numOfSongs: provider.countSongsByCategory('custom'),
                            image: 'assets/images/custom.png',
                            onTap: () {
                              Navigator.pushNamed(context, '/lullaby-custom');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Consumer<SleepProvider>(
                        builder: (context, provider, child) {
                          return Text(
                              'Current Song: ${provider.currentSong?.name ?? 'None'}');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      )),
    );
  }
}
