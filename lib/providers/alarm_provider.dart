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
      final response = await Caller.dio.get('/alarms');
      if (response.statusCode == 200 && response.data['success']) {
        final data = response.data['data'] as List;
        _alarms = data.map((json) => Alarm.fromJson(json)).toList();
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching alarms: $e');
    }
  }

  // Add a new alarm
  Future<void> addAlarm(Alarm alarm) async {
    try {
      final response = await Caller.dio.post('/alarms', data: alarm.toJson());
      if (response.statusCode == 200 && response.data['success']) {
        fetchAlarms(); // Refresh the alarm list
      }
    } catch (e) {
      print('Error adding alarm: $e');
    }
  }

  // Update an alarm
  Future<void> updateAlarm(String id, Alarm updatedAlarm) async {
    try {
      final response =
          await Caller.dio.put('/alarms/$id', data: updatedAlarm.toJson());
      if (response.statusCode == 200 && response.data['success']) {
        fetchAlarms();
      }
    } catch (e) {
      print('Error updating alarm: $e');
    }
  }

  // Delete an alarm
  Future<void> deleteAlarm(String id) async {
    try {
      final response = await Caller.dio.delete('/alarms/$id');
      if (response.statusCode == 200 && response.data['success']) {
        fetchAlarms();
      }
    } catch (e) {
      print('Error deleting alarm: $e');
    }
  }
}
