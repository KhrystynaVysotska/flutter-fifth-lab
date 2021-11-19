import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:river_water_level/api/constants.dart';
import 'package:river_water_level/models/latest_measurement.dart';

class MeasurementsApi {
  Future<List<LatestMeasurement>> getLatestMeasurements() async {
    final response =
        await http.get(Uri.parse(BASE_URL + LATEST_MEASUREMENTS_ENDPOINT));

    if (response.statusCode == 200) {
      final List<dynamic> latestMeasurementsJson = json.decode(response.body);
      return latestMeasurementsJson
          .map((json) => LatestMeasurement.fromJson(json))
          .toList();
    } else {
      throw Exception('Error fetching latest measurements');
    }
  }
}
