import 'dart:async';
import 'package:river_water_level/api/measurements/measurements_api_wrapper.dart';
import 'package:river_water_level/bloc/events/alert_measurements_event.dart';
import 'package:river_water_level/bloc/states/alert_measurements_state.dart';
import 'package:river_water_level/models/latest_measurement.dart';

class AlertMeasurementsBloc {
  AlertMeasurementsState _state = AlertMeasurementsClearedState();
  final MeasurementsApiWrapper measurementsApiWrapper =
      MeasurementsApiWrapper();

  final _inputEventController = StreamController<AlertMeasurementsEvent>();
  final _outputStateController = StreamController<AlertMeasurementsState>();

  AlertMeasurementsState get initialState => AlertMeasurementsClearedState();

  StreamSink<AlertMeasurementsEvent> get inputEventSink =>
      _inputEventController.sink;

  Stream<AlertMeasurementsState> get outputStateStream =>
      _outputStateController.stream;

  Future<void> _mapEventToState(AlertMeasurementsEvent event) async {
    if (event is AlertMeasurementsLoadEvent) {
      _state = AlertMeasurementsLoadingState();
      _outputStateController.sink.add(_state);
      try {
        List<LatestMeasurement> _loadedAlertMeasurements =
            await measurementsApiWrapper.getCriticalMeasurements();
        _state = AlertMeasurementsLoadedState(
          loadedAlertMeasurements: _loadedAlertMeasurements,
        );
      } catch (_) {
        _state = AlertMeasurementsFailedState();
      }
    } else if (event is AlertMeasurementsClearEvent) {
      _state = AlertMeasurementsClearedState();
    } else {
      throw Exception("Unknown event type");
    }
    _outputStateController.sink.add(_state);
  }

  AlertMeasurementsBloc() {
    _inputEventController.stream.listen(_mapEventToState);
    inputEventSink.add(AlertMeasurementsLoadEvent());
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
