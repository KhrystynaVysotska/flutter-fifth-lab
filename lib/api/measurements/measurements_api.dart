import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:river_water_level/api/constants.dart';
import 'package:river_water_level/models/latest_measurement.dart';
import 'package:river_water_level/models/measurement.dart';

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

  Future<List<Measurement>> getMeasurementsBy(int sensorId) async {
    final queryString = '?float_sensor_id=' + sensorId.toString();
    final uri = Uri.parse(BASE_URL + MEASUREMENT_ENDPOINT + queryString);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> measurementsJson = json.decode(response.body);
      return measurementsJson
          .map((json) => Measurement.fromJson(json))
          .toList();
    } else {
      throw Exception('Error fetching measurements');
    }
  }
}
