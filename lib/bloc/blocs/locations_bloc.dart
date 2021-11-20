import 'dart:async';
import 'package:river_water_level/api/locations/locations_api_wrapper.dart';
import 'package:river_water_level/bloc/events/locations_event.dart';
import 'package:river_water_level/bloc/states/locations_state.dart';
import 'package:river_water_level/models/location.dart';

class LocationsBloc {
  LocationsState _state = LocationsEmptyState();
  final LocationsApiWrapper locationsApiWrapper = LocationsApiWrapper();

  final _inputEventController = StreamController<LocationsEvent>.broadcast();
  final _outputStateController = StreamController<LocationsState>.broadcast();

  LocationsState get initialState => _state;

  StreamSink<LocationsEvent> get inputEventSink => _inputEventController.sink;

  Stream<LocationsState> get outputStateStream => _outputStateController.stream;

  Future<void> _mapEventToState(LocationsEvent event) async {
    if (event is LocationsLoadEvent) {
      _state = LocationsLoadingState();
      _outputStateController.sink.add(_state);
      try {
        final List<Location> _loadedLocations =
            await locationsApiWrapper.getAllLocationsBy(event.riverId);
        _state = LocationsLoadedState(loadedLocations: _loadedLocations);
      } catch (_) {
        _state = LocationsFailedState();
      }
    } else {
      throw Exception("Unknown event type");
    }
    _outputStateController.sink.add(_state);
  }

  LocationsBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
