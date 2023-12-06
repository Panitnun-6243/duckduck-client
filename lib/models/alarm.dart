import 'package:flutter/material.dart';

class Alarm {
  final String id;
  final TimeModel bedTime;
  final TimeModel wakeUpTime;
  final String description;
  final ActiveStatus isActive;
  final List<String> repeatDays;
  final Sunrise sunrise;
  final String currentAlarmSound;
  final String currentAlarmSoundPath;
  final double volume;
  final int snoozeTime;
  final DateTime createdAt;
  final DateTime updatedAt;

  Alarm({
    required this.id,
    required this.bedTime,
    required this.wakeUpTime,
    required this.description,
    required this.isActive,
    required this.repeatDays,
    required this.sunrise,
    required this.currentAlarmSound,
    required this.currentAlarmSoundPath,
    required this.volume,
    required this.snoozeTime,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Alarm.fromJson(Map<String, dynamic> json) {
    return Alarm(
      id: json['id'],
      bedTime: TimeModel.fromJson(json['bed_time']),
      wakeUpTime: TimeModel.fromJson(json['wake_up_time']),
      description: json['description'],
      isActive: ActiveStatus.fromJson(json['is_active']),
      repeatDays: List<String>.from(json['repeat_days']),
      sunrise: Sunrise.fromJson(json['sunrise']),
      currentAlarmSound: json['current_alarm_sound'],
      currentAlarmSoundPath: json['current_alarm_sound_path'],
      volume: json['volume'].toDouble(),
      snoozeTime: json['snooze_time'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class TimeModel {
  final int hours;
  final int minutes;

  TimeModel({required this.hours, required this.minutes});

  factory TimeModel.fromJson(Map<String, dynamic> json) {
    return TimeModel(hours: json['hours'], minutes: json['minutes']);
  }

  TimeOfDay toTimeOfDay() => TimeOfDay(hour: hours, minute: minutes);
}

class ActiveStatus {
  final bool status;
  final DateTime dateActive;

  ActiveStatus({required this.status, required this.dateActive});

  factory ActiveStatus.fromJson(Map<String, dynamic> json) {
    return ActiveStatus(
      status: json['status'],
      dateActive: DateTime.parse(json['date_active']),
    );
  }
}

class Sunrise {
  final TimeModel startTime;
  final TimeModel peakTime;

  Sunrise({required this.startTime, required this.peakTime});

  factory Sunrise.fromJson(Map<String, dynamic> json) {
    return Sunrise(
      startTime: TimeModel.fromJson(json['start_time']),
      peakTime: TimeModel.fromJson(json['peak_time']),
    );
  }
}
