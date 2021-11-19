import 'package:river_water_level/api/measurements/measurements_api.dart';
import 'package:river_water_level/models/latest_measurement.dart';

class MeasurementsApiWrapper {
  final MeasurementsApi _measurementsApi = MeasurementsApi();

  Future<List<LatestMeasurement>> getAllLatestMeasurements() =>
      _measurementsApi.getLatestMeasurements();

  Future<List<LatestMeasurement>> getCriticalMeasurements() async {
    List<LatestMeasurement> latest =
        await _measurementsApi.getLatestMeasurements();
    return latest.where((measurement) => measurement.isCritical).toList();
  }
}
