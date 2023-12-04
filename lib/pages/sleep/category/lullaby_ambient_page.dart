import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../controller/http_handler.dart';
import '../../../models/lullaby_song.dart';
import '../../../providers/sleep_provider.dart';
import '../../../utils/colors.dart';

class LullabyAmbientPage extends StatefulWidget {
  const LullabyAmbientPage({super.key});

  @override
  State<LullabyAmbientPage> createState() => _LullabyAmbientPageState();
}

class _LullabyAmbientPageState extends State<LullabyAmbientPage> {
  late Future<List<LullabySong>> futureSongs;
  LullabySong? selectedSong;

  @override
  void initState() {
    super.initState();
    futureSongs = Caller.fetchLullabySongs();
  }

  @override
  Widget build(BuildContext context) {
    final sleepProvider = Provider.of<SleepProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      splashRadius: 25,
                      iconSize: 17,
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Ambient song',
                      style: GoogleFonts.rubik(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: DuckDuckColors.steelBlack),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Divider(
                height: 1,
                color: Color(0xffE7E7E7),
                thickness: 1,
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: FutureBuilder<List<LullabySong>>(
                        future: futureSongs,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            List<LullabySong> songs = snapshot.data!
                                .where((song) => song.category == 'noice')
                                .toList();
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount: songs.length,
                              itemBuilder: (context, index) {
                                final song = songs[index];
                                bool isSelected =
                                    sleepProvider.currentSong?.id == song.id;
                                return ListTile(
                                  title: Text(
                                    song.name,
                                    style: GoogleFonts.rubik(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: DuckDuckColors.steelBlack),
                                  ),
                                  trailing: isSelected
                                      ? const Icon(Icons.check_circle,
                                          color: Colors.green)
                                      : null,
                                  onTap: () {
                                    sleepProvider.setCurrentSong(song);
                                  },
                                );
                              },
                            );
                          } else {
                            return const Text('No songs found');
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
