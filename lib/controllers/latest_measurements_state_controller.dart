import 'package:flutter/material.dart';
import 'package:river_water_level/bloc/blocs/latest_measurements_bloc.dart';
import 'package:river_water_level/bloc/events/latest_measurements_event.dart';
import 'package:river_water_level/bloc/states/latest_measurements_state.dart';
import 'package:river_water_level/widgets/measurements/latest_measurements_carousel.dart';

class LatestMeasurementsStateController extends StatefulWidget {
  const LatestMeasurementsStateController({Key? key}) : super(key: key);

  @override
  _LatestMeasurementsStateControllerState createState() =>
      _LatestMeasurementsStateControllerState();
}

class _LatestMeasurementsStateControllerState
    extends State<LatestMeasurementsStateController> {
  final LatestMeasurementsBloc _latestMeasurementsBloc =
      LatestMeasurementsBloc();

  @override
  void initState() {
    super.initState();
    _latestMeasurementsBloc.inputEventSink.add(LatestMeasurementsLoadEvent());
  }

  @override
  void dispose() {
    _latestMeasurementsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _latestMeasurementsBloc.outputStateStream,
      initialData: _latestMeasurementsBloc.initialState,
      builder: (context, snapshot) {
        if (snapshot.data is LatestMeasurementsEmptyState) {
          return const Center(child: Text("No data received"));
        }
        if (snapshot.data is LatestMeasurementsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data is LatestMeasurementsLoadedState) {
          return LatestMeasurementsCarousel(
            latestMeasurements: (snapshot.data as LatestMeasurementsLoadedState)
                .loadedLatestMeasurements,
          );
        }
        if (snapshot.data is LatestMeasurementsFailedState) {
          return const Center(
            child: Text("Error fetching latest measurements"),
          );
        }
        return const Text('Unknown state');
      },
    );
  }
}
