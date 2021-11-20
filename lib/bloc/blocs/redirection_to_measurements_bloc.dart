import 'dart:async';
import 'package:flutter/material.dart';
import 'package:river_water_level/bloc/events/redirection_to_measurements_event.dart';
import 'package:river_water_level/controllers/measurements_state_controller.dart';

class RedirectionToMeasurementsBloc {
  final _inputEventController = StreamController<RedirectionEvent>.broadcast();

  StreamSink<RedirectionEvent> get inputEventSink => _inputEventController.sink;

  void _mapEventToState(RedirectionEvent event) {
    if (event is RedirectionToMeasurementsEvent) {
      Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (_) => MeasurementsStateController(sensorId: event.sensorId),
        ),
      );
    } else {
      throw Exception("Unknown event type");
    }
  }

  RedirectionToMeasurementsBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
  }
}
