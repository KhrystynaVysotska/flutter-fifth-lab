class Location {
  final int id;
  final int sensorId;
  final String region;
  final String country;
  final String settlement;
  final String imageUrl;

  Location({
    required this.id,
    required this.sensorId,
    required this.region,
    required this.country,
    required this.settlement,
    required this.imageUrl,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      sensorId: json['float_sensors'][0]['id'],
      region: json['locality']['region'],
      country: json['locality']['country'],
      imageUrl: json['locality']['image_url'] ?? "",
      settlement: json['locality']['settlement'],
    );
  }
}
