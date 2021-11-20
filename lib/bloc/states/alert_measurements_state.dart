import 'package:river_water_level/models/latest_measurement.dart';

abstract class AlertMeasurementsState {}

class AlertMeasurementsEmptyState extends AlertMeasurementsState {}

class AlertMeasurementsLoadingState extends AlertMeasurementsState {}

class AlertMeasurementsLoadedState extends AlertMeasurementsState {
  List<LatestMeasurement> loadedAlertMeasurements;

  AlertMeasurementsLoadedState({required this.loadedAlertMeasurements});
}

class AlertMeasurementsFailedState extends AlertMeasurementsState {}

class AlertMeasurementsClearedState extends AlertMeasurementsState {}
