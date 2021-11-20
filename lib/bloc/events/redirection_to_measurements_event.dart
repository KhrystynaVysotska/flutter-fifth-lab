import 'package:flutter/material.dart';

abstract class RedirectionEvent {}

class RedirectionToMeasurementsEvent extends RedirectionEvent {
  int sensorId;
  BuildContext context;

  RedirectionToMeasurementsEvent({
    required this.context,
    required this.sensorId,
  });
}
