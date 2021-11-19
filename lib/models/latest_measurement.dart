class LatestMeasurement {
  final int id;
  final bool isCritical;
  final String timestamp;
  final String riverName;
  final String locationName;
  final double maxWaterLevel;
  final double actualWaterLevel;

  LatestMeasurement({
    required this.id,
    required this.timestamp,
    required this.riverName,
    required this.locationName,
    required this.maxWaterLevel,
    required this.actualWaterLevel,
  }) : isCritical = actualWaterLevel > maxWaterLevel;

  factory LatestMeasurement.fromJson(Map<String, dynamic> json) {
    return LatestMeasurement(
      id: json['measurement']['id'],
      timestamp: json['measurement']['timestamp'],
      riverName: json['measurement_point']['river']['name'],
      locationName: json['measurement_point']['locality']['settlement'],
      actualWaterLevel:
          double.parse(json['measurement']['water_level_in_metres']),
      maxWaterLevel:
          double.parse(json['measurement_point']['max_water_level_in_metres']),
    );
  }
}
