import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../controller/http_handler.dart';
import '../models/dim_light.dart';
import '../models/lullaby_song.dart';
import '../models/sleep_data.dart';

class SleepProvider with ChangeNotifier {
  LullabySong? _currentSong;
  List<LullabySong> _allSongs = [];
  DimLight _dimLight = DimLight(isActive: false, duration: 6);

  LullabySong? get currentSong => _currentSong;
  String get currentSongName => _currentSong?.name ?? "";
  List<LullabySong> get allSongs => _allSongs;
  DimLight get dimLight => _dimLight;

  List<SleepData> _sleepStats = [];
  List<SleepData> get sleepStats => _sleepStats;
  Dio dio = Caller.dio;

  SleepProvider() {
    initProvider();
  }

  Future<void> initProvider() async {
    await fetchAllSongs();
    await fetchSleepClinicData();
  }

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

  Future<void> fetchSleepClinicData() async {
    try {
      var data = await Caller.fetchSleepClinicData();
      // Assuming 'data' contains the required fields
      _currentSong = _allSongs.firstWhere(
        (song) => song.name == data['current_lullaby_song'],
        orElse: () => LullabySong(id: '', name: '', path: '', category: ''),
      );
      _dimLight = DimLight.fromJson(data['dim_light']);
      _sleepStats = (data['sleep_stats'] as List)
          .map((e) => SleepData.fromJson(e))
          .toList();
      notifyListeners();
    } catch (e) {
      print("Error fetching clinic data: $e");
    }
  }

  Future<bool> updateSleepClinicData() async {
    try {
      var data = await Caller.fetchSleepClinicData();
      var updateData = {
        "current_lullaby_song": _currentSong?.name ?? "",
        "dim_light": _dimLight.toJson(),
      };
      var response = await Caller.updateSleepClinicData(data["id"], updateData);
      return response.statusCode == 200;
    } catch (e) {
      print("Error updating clinic data: $e");
      return false;
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
