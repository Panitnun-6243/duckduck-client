class Users {
  final String? email;
  final String? name;
  final String? deviceCode;
  final String? avatarUrl;

  Users({
    this.email,
    this.name,
    this.deviceCode,
    this.avatarUrl,
  });

  // Add fromJson constructor
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      email: json['email'],
      name: json['name'],
      deviceCode: json['device_code'],
      avatarUrl: json['avatar_url'],
    );
  }
}
