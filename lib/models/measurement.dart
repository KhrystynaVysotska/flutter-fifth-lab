class Measurement {
  final int id;
  final String timestamp;
  final double waterLevel;

  Measurement({
    required this.id,
    required this.timestamp,
    required this.waterLevel,
  });

  factory Measurement.fromJson(Map<String, dynamic> json) {
    return Measurement(
      id: json['id'],
      timestamp: json['timestamp'],
      waterLevel: double.parse(json['water_level_in_metres']),
    );
  }
}
