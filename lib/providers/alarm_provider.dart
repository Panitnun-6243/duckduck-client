import 'package:flutter/foundation.dart';
import '../controller/http_handler.dart';
import 'package:flutter/material.dart';
import '../models/alarm.dart';
import '../models/alarm_sound.dart';

class AlarmProvider with ChangeNotifier {
  List<Alarm> _alarms = [];

  String currentAlarmSound = "Digital";

  String currentAlarmSoundPath =
      "https://storage.googleapis.com/duckduck-bucket/alarm-sound/digital.mp3";
  List<Alarm> get alarms => _alarms;

  List<AlarmSound> _presetAlarmSounds = [];
  List<AlarmSound> get presetAlarmSounds => _presetAlarmSounds;

  // Initialize the provider
  AlarmProvider() {
    initProvider();
  }

  Future<void> initProvider() async {
    await fetchAllData();
  }

  // Fetch all alarms
  Future<void> fetchAlarms() async {
    try {
      _alarms = await Caller.fetchAlarms();
      notifyListeners();
    } catch (e) {
      print('Error fetching alarms: $e');
    }
  }

  Future<void> fetchAllData() async {
    try {
      _alarms = await Caller.fetchAlarms();
      _presetAlarmSounds = await Caller.fetchPresetAlarmSounds();
      notifyListeners();
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  // Add a new alarm
  Future<void> addAlarm(Alarm alarm) async {
    try {
      Map<String, dynamic> alarmJson = alarm.toJson();
      alarmJson.remove("id");
      alarmJson["is_active"] = {"status": true};
      print(alarmJson);
      final response = await Caller.addAlarm(alarmJson);
      if (response.statusCode == 200 && response.data['success']) {
        await fetchAlarms(); // Refresh the alarm list
      }
    } catch (e) {
      print('Error adding alarm: $e');
    }
  }

  // Update an alarm
  Future<void> updateAlarm(String id, Alarm updatedAlarm) async {
    try {
      Map<String, dynamic> alarmJson = updatedAlarm.toJson();
      alarmJson.remove("id");
      alarmJson["is_active"] = {"status": true};
      final response = await Caller.updateAlarm(id, alarmJson);
      if (response.statusCode == 200 && response.data['success']) {
        await fetchAlarms(); // Refresh the alarm list
      }
    } catch (e) {
      print('Error updating alarm: $e');
    }
  }

  Future<void> toggleAlarm(Alarm alarm, bool newStatus) async {
    try {
      Map<String, dynamic> alarmJson = alarm.toJson();
      alarmJson.remove("id");
      alarmJson["is_active"] = {"status": newStatus};
      final response = await Caller.updateAlarm(alarm.id!, alarmJson);
      if (response.statusCode == 200 && response.data['success']) {
        await fetchAlarms(); // Refresh the alarm list
      }
    } catch (e) {
      print('Error toggling alarm: $e');
    }
  }

  // Delete an alarm
  Future<void> deleteAlarm(String id) async {
    try {
      final response = await Caller.deleteAlarm(id);
      if (response.statusCode == 200 && response.data['success']) {
        await fetchAlarms(); // Refresh the alarm list
      }
    } catch (e) {
      print('Error deleting alarm: $e');
    }
  }

  // Fetch all preset alarm sounds
  Future<List<AlarmSound>> fetchPresetAlarmSounds() async {
    try {
      final sounds = await Caller.fetchPresetAlarmSounds();
      return sounds;
    } catch (e) {
      print('Error fetching preset alarm sounds: $e');
      return [];
    }
  }

  // Set the current alarm sound
  void setCurrentAlarmSound(String name, String path) {
    currentAlarmSound = name;
    currentAlarmSoundPath = path;
    notifyListeners();
  }
}
