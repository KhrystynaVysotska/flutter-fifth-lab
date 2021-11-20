class River {
  final int id;
  final String name;
  final double length;
  final String imageUrl;
  final double basinArea;

  River({
    required this.id,
    required this.name,
    required this.length,
    required this.imageUrl,
    required this.basinArea,
  });

  factory River.fromJson(Map<String, dynamic> json) {
    return River(
      id: json['id'],
      name: json['name'],
      length: double.parse(json['length_in_km']),
      imageUrl: json['image_url'] ?? "",
      basinArea: double.parse(json['basin_area_in_sq_km']),
    );
  }
}
