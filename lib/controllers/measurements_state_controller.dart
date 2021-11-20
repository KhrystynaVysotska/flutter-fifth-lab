import 'package:flutter/material.dart';
import 'package:river_water_level/bloc/blocs/measurements_bloc.dart';
import 'package:river_water_level/bloc/events/measurements_event.dart';
import 'package:river_water_level/bloc/states/measurements_state.dart';
import 'package:river_water_level/pages/measurements_page.dart';
import 'package:river_water_level/widgets/common/custom_scaffold.dart';

class MeasurementsStateController extends StatelessWidget {
  const MeasurementsStateController({Key? key, required this.sensorId})
      : super(key: key);

  final int sensorId;

  @override
  Widget build(BuildContext context) {
    final MeasurementsBloc _measurementsBloc = MeasurementsBloc();

    _measurementsBloc.inputEventSink
        .add(MeasurementsLoadEvent(sensorId: sensorId));

    return SafeArea(
      child: CustomScaffold(
        body: StreamBuilder(
          stream: _measurementsBloc.outputStateStream,
          initialData: _measurementsBloc.initialState,
          builder: (context, snapshot) {
            if (snapshot.data is MeasurementsEmptyState) {
              return const Center(child: Text("No data received"));
            }
            if (snapshot.data is MeasurementsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data is MeasurementsLoadedState) {
              return MeasurementsPage(
                measurements: (snapshot.data as MeasurementsLoadedState)
                    .loadedMeasurements,
              );
            }
            if (snapshot.data is MeasurementsFailedState) {
              return const Center(child: Text("Error fetching measurements"));
            }
            return const Text('Unknown state');
          },
        ),
      ),
    );
  }
}
