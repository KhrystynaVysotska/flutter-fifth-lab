abstract class MeasurementsEvent {}

class MeasurementsLoadEvent extends MeasurementsEvent {
  int sensorId;

  MeasurementsLoadEvent({required this.sensorId});
}
