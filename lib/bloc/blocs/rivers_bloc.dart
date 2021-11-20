import 'dart:async';

import 'package:river_water_level/api/rivers/rivers_api_wrapper.dart';
import 'package:river_water_level/bloc/events/rivers_event.dart';
import 'package:river_water_level/bloc/states/rivers_state.dart';
import 'package:river_water_level/models/river.dart';

class RiversBloc {
  RiversState _state = RiversEmptyState();
  final RiversApiWrapper riversApiWrapper = RiversApiWrapper();

  final _inputEventController = StreamController<RiversEvent>.broadcast();
  final _outputStateController = StreamController<RiversState>.broadcast();

  RiversState get initialState => _state;

  StreamSink<RiversEvent> get inputEventSink => _inputEventController.sink;

  Stream<RiversState> get outputStateStream => _outputStateController.stream;

  Future<void> _mapEventToState(RiversEvent event) async {
    if (event is RiversLoadEvent) {
      _state = RiversLoadingState();
      _outputStateController.sink.add(_state);
      try {
        final List<River> _loadedRivers = await riversApiWrapper.getAllRivers();
        _state = RiversLoadedState(loadedRivers: _loadedRivers);
      } catch (_) {
        _state = RiversFailedState();
      }
    } else {
      throw Exception("Unknown event type");
    }
    _outputStateController.sink.add(_state);
  }

  RiversBloc() {
    _inputEventController.stream.listen(_mapEventToState);
    inputEventSink.add(RiversLoadEvent());
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
