class SleepData {
  final String date;
  final double sleepDurationHours;

  SleepData({required this.date, required this.sleepDurationHours});

  factory SleepData.fromJson(Map<String, dynamic> json) {
    return SleepData(
      date: json['date'],
      sleepDurationHours: json['sleep_duration_hours'].toDouble(),
    );
  }
}
