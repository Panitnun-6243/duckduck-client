import 'package:flutter/material.dart';
import '../controller/http_handler.dart';
import '../models/dim_light.dart';
import '../models/lullaby_song.dart';

class SleepProvider with ChangeNotifier {
  LullabySong? _currentSong;
  List<LullabySong> _allSongs = [];
  DimLight _dimLight = DimLight(isActive: false, duration: 5);

  LullabySong? get currentSong => _currentSong;
  List<LullabySong> get allSongs => _allSongs;
  DimLight get dimLight => _dimLight;

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

  void setDimLight(bool isActive, int duration) {
    _dimLight = DimLight(isActive: isActive, duration: duration);
    notifyListeners();
  }
}
