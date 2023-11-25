class Users {
  final String? email;
  final String? name;
  final String? deviceCode;

  Users({
    this.email,
    this.name,
    this.deviceCode,
  });

  // Add fromJson constructor
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      email: json['email'],
      name: json['name'],
      deviceCode: json['deviceCode'],
    );
  }
}
