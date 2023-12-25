class AlarmSound {
  final String id;
  final String name;
  final String path;

  AlarmSound({required this.id, required this.name, required this.path});

  factory AlarmSound.fromJson(Map<String, dynamic> json) {
    return AlarmSound(
      id: json['id'],
      name: json['name'],
      path: json['path'],
    );
  }
}
