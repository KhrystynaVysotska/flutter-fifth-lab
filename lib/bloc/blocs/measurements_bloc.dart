import 'dart:async';

import 'package:river_water_level/api/measurements/measurements_api_wrapper.dart';
import 'package:river_water_level/bloc/events/measurements_event.dart';
import 'package:river_water_level/bloc/states/measurements_state.dart';
import 'package:river_water_level/models/measurement.dart';

class MeasurementsBloc {
  MeasurementsState _state = MeasurementsEmptyState();
  final MeasurementsApiWrapper measurementsApiWrapper =
      MeasurementsApiWrapper();

  final _inputEventController = StreamController<MeasurementsEvent>.broadcast();
  final _outputStateController =
      StreamController<MeasurementsState>.broadcast();

  MeasurementsState get initialState => _state;

  StreamSink<MeasurementsEvent> get inputEventSink =>
      _inputEventController.sink;

  Stream<MeasurementsState> get outputStateStream =>
      _outputStateController.stream;

  List<Measurement> _getNLatestMeasurements(
      List<Measurement> measurements, int n) {
    List<Measurement> reversed = List.from(measurements.reversed);
    return reversed.take(n).toList();
  }

  Future<void> _mapEventToState(MeasurementsEvent event) async {
    if (event is MeasurementsLoadEvent) {
      _state = MeasurementsLoadingState();
      _outputStateController.sink.add(_state);
      try {
        List<Measurement> _measurements =
            await measurementsApiWrapper.getAllMeasurementsBy(event.sensorId);
        _measurements = _getNLatestMeasurements(_measurements, 100);
        _state = MeasurementsLoadedState(loadedMeasurements: _measurements);
      } catch (_) {
        _state = MeasurementsFailedState();
      }
    } else {
      throw Exception("Unknown event type");
    }
    _outputStateController.sink.add(_state);
  }

  MeasurementsBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
