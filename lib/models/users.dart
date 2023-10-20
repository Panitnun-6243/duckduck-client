class Users {
  final String uid;
  final String? email;
  final String? name;
  final String? deviceCode;

  Users({
    required this.uid,
    this.email,
    this.name,
    this.deviceCode,
  });
}
