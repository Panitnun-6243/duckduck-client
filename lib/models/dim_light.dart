class DimLight {
  bool isActive;
  int duration;

  DimLight({required this.isActive, required this.duration});

  factory DimLight.fromJson(Map<String, dynamic> json) {
    return DimLight(
      isActive: json['is_active'],
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'is_active': isActive,
      'duration': duration,
    };
  }
}
