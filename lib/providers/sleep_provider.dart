import 'package:flutter/material.dart';
import '../controller/http_handler.dart';
import '../models/lullaby_song.dart';

class SleepProvider with ChangeNotifier {
  LullabySong? _currentSong;
  List<LullabySong> _allSongs = [];

  LullabySong? get currentSong => _currentSong;
  List<LullabySong> get allSongs => _allSongs;

  void setCurrentSong(LullabySong song) {
    _currentSong = song;
    notifyListeners();
  }

  Future<void> fetchAllSongs() async {
    try {
      _allSongs = await Caller.fetchLullabySongs();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  int countSongsByCategory(String category) {
    return _allSongs.where((song) => song.category == category).length;
  }
}
