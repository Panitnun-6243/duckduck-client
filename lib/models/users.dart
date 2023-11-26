class Users {
  String? email;
  String? name;
  String? deviceCode;
  String? avatarUrl;

  Users({
    this.email,
    this.name,
    this.deviceCode,
    this.avatarUrl,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      email: json['email'],
      name: json['name'],
      deviceCode: json['device_code'],
      avatarUrl: json['avatar_url'],
    );
  }
}
