import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';

import '../models/alarm.dart';
import '../models/alarm_sound.dart';
import '../models/lullaby_song.dart';

class Caller {
  static BaseOptions options = BaseOptions(
    baseUrl: "https://dduck.panitnun.tech/api/v1",
    contentType: 'application/json',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  );

  static Dio dio = Dio(options);

  static setToken(String token) {
    dio.options.headers["Authorization"] = "Bearer $token";
  }

  // alarm
  static Future<List<Alarm>> fetchAlarms() async {
    try {
      final response = await dio.get(
        '/alarms',
      );
      if (response.data['success'] == true) {
        print('test: already fetch (${response.data['data']})');
        if (response.data['data'] == null) return [];
        return (response.data['data'] as List)
            .map((json) => Alarm.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load alarms');
      }
    } on DioException catch (e) {
      print(e.message);
      rethrow;
    }
  }

  static Future<Response> addAlarm(Map<String, dynamic> alarmData) async {
    try {
      return await dio.post(
        '/alarms',
        data: alarmData,
      );
    } on DioException catch (e) {
      print('Add Alarm Error: ${e.message}');
      rethrow;
    }
  }

  static Future<Response> updateAlarm(
      String id, Map<String, dynamic> alarmData) async {
    try {
      return await dio.put(
        '/alarms/$id',
        data: alarmData,
      );
    } on DioException catch (e) {
      print('Update Alarm Error: ${e.message}');
      rethrow;
    }
  }

  static Future<Response> deleteAlarm(String id) async {
    try {
      return await dio.delete(
        '/alarms/$id',
      );
    } on DioException catch (e) {
      print('Delete Alarm Error: ${e.message}');
      rethrow;
    }
  }

  static Future<List<AlarmSound>> fetchPresetAlarmSounds() async {
    try {
      final response = await dio.get('/preset-alarm-sound');
      if (response.data['success'] == true) {
        print('test: already fetch alarm sounds');
        List<dynamic> soundsJson = response.data['data'];
        return soundsJson.map((json) => AlarmSound.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load preset alarm sounds');
      }
    } on DioException catch (e) {
      print(e.message);
      rethrow;
    }
  }

  // sleep clinic
  static Future<List<LullabySong>> fetchLullabySongs() async {
    try {
      final response = await dio.get('/preset-lullaby-song');
      if (response.data['success'] == true) {
        List<dynamic> songsJson = response.data['data'];
        return songsJson.map((json) => LullabySong.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load songs');
      }
    } on DioException catch (e) {
      print(e.message);
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> fetchSleepClinicData() async {
    try {
      final response = await dio.get(
        '/sleep-clinic',
      );
      if (response.statusCode == 200) {
        print("test: already fetch");
        print(response.data["data"]);
        return response.data["data"];
      } else {
        throw Exception('Failed to fetch sleep clinic data');
      }
    } on DioException catch (e) {
      print(e.message);
      rethrow;
    }
  }

  static Future<Response> updateSleepClinicData(
      String sleepClinicId, Map<String, dynamic> data) async {
    return await dio.put(
      '/sleep-clinic/$sleepClinicId',
      data: data,
    );
  }

  // error handling
  static handle(BuildContext context, DioException error) {
    if (error.response == null) {
      FlutterPlatformAlert.showAlert(
          windowTitle: 'Something went wrong',
          text: error.message ?? "Unknown");
      return;
    }

    SnackBar snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(15),
      backgroundColor: const Color(0xffB00020),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(error.response!.data["message"]),
          error.response!.data["error"] == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    error.response!.data["error"],
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static error(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(15),
      backgroundColor: const Color(0xffB00020),
      content: Text(message),
    ));
  }

  static inform(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(15),
      content: Text(message),
    ));
  }
}
