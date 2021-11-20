import 'package:river_water_level/models/latest_measurement.dart';

abstract class LatestMeasurementsState {}

class LatestMeasurementsEmptyState extends LatestMeasurementsState {}

class LatestMeasurementsLoadingState extends LatestMeasurementsState {}

class LatestMeasurementsLoadedState extends LatestMeasurementsState {
  List<LatestMeasurement> loadedLatestMeasurements;

  LatestMeasurementsLoadedState({required this.loadedLatestMeasurements});
}

class LatestMeasurementsFailedState extends LatestMeasurementsState {}
