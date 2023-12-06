import 'package:flutter/foundation.dart';
import '../controller/http_handler.dart';
import 'package:flutter/material.dart';
import '../models/alarm.dart';

class AlarmProvider with ChangeNotifier {
  List<Alarm> _alarms = [];
  List<Alarm> get alarms => _alarms;

  // Fetch all alarms
  Future<void> fetchAlarms() async {
    try {
      _alarms = await Caller.fetchAlarms();
      notifyListeners();
    } catch (e) {
      print('Error fetching alarms: $e');
    }
  }

  // Add a new alarm
  Future<void> addAlarm(Alarm alarm) async {
    try {
      final response = await Caller.addAlarm(alarm.toJson());
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
      final response = await Caller.updateAlarm(id, updatedAlarm.toJson());
      if (response.statusCode == 200 && response.data['success']) {
        await fetchAlarms(); // Refresh the alarm list
      }
    } catch (e) {
      print('Error updating alarm: $e');
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
}
