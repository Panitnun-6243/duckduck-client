class LullabySong {
  final String id;
  final String name;
  final String path;
  final String category;

  LullabySong(
      {required this.id,
      required this.name,
      required this.path,
      required this.category});

  factory LullabySong.fromJson(Map<String, dynamic> json) {
    return LullabySong(
      id: json['id'],
      name: json['name'],
      path: json['path'],
      category: json['category'],
    );
  }
}
