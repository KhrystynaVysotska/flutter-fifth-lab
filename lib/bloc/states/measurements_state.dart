import 'package:river_water_level/models/measurement.dart';

abstract class MeasurementsState {}

class MeasurementsEmptyState extends MeasurementsState {}

class MeasurementsLoadingState extends MeasurementsState {}

class MeasurementsLoadedState extends MeasurementsState {
  List<Measurement> loadedMeasurements;

  MeasurementsLoadedState({required this.loadedMeasurements});
}

class MeasurementsFailedState extends MeasurementsState {}
