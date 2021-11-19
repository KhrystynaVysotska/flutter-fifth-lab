import 'dart:async';
import 'package:river_water_level/api/measurements/measurements_api_wrapper.dart';
import 'package:river_water_level/bloc/events/latest_measurements_event.dart';
import 'package:river_water_level/bloc/states/latest_measurements_state.dart';
import 'package:river_water_level/models/latest_measurement.dart';

class LatestMeasurementsBloc {
  LatestMeasurementsState _state = LatestMeasurementsEmptyState();
  final MeasurementsApiWrapper measurementsApiWrapper =
      MeasurementsApiWrapper();
  
  final _inputEventController = StreamController<LatestMeasurementsEvent>();
  final _outputStateController = StreamController<LatestMeasurementsState>();

  LatestMeasurementsState get initialState => LatestMeasurementsEmptyState();

  StreamSink<LatestMeasurementsEvent> get inputEventSink =>
      _inputEventController.sink;

  Stream<LatestMeasurementsState> get outputStateStream =>
      _outputStateController.stream;

  Future<void> _mapEventToState(LatestMeasurementsEvent event) async {
    if (event is LatestMeasurementsLoadEvent) {
      _state = LatestMeasurementsLoadingState();
      _outputStateController.sink.add(_state);
      try {
        final List<LatestMeasurement> _loadedLatestMeasurements =
            await measurementsApiWrapper.getAllLatestMeasurements();
        _state = LatestMeasurementsLoadedState(
          loadedLatestMeasurements: _loadedLatestMeasurements,
        );
      } catch (_) {
        _state = LatestMeasurementsFailedState();
      }
    } else {
      throw Exception("Unknown event type");
    }
    _outputStateController.sink.add(_state);
  }

  LatestMeasurementsBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
