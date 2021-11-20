import 'package:flutter/material.dart';
import 'package:river_water_level/bloc/blocs/locations_bloc.dart';
import 'package:river_water_level/bloc/events/locations_event.dart';
import 'package:river_water_level/bloc/states/locations_state.dart';
import 'package:river_water_level/pages/locations_page.dart';
import 'package:river_water_level/widgets/common/custom_scaffold.dart';

class LocationsStateController extends StatelessWidget {
  const LocationsStateController({Key? key, required this.riverId})
      : super(key: key);

  final int riverId;

  @override
  Widget build(BuildContext context) {
    final LocationsBloc _locationsBloc = LocationsBloc();

    _locationsBloc.inputEventSink.add(LocationsLoadEvent(riverId: riverId));

    return SafeArea(
      child: CustomScaffold(
        body: StreamBuilder(
          stream: _locationsBloc.outputStateStream,
          initialData: _locationsBloc.initialState,
          builder: (context, snapshot) {
            if (snapshot.data is LocationsEmptyState) {
              return const Center(child: Text("No data received"));
            }
            if (snapshot.data is LocationsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data is LocationsLoadedState) {
              return LocationsPage(
                locations:
                    (snapshot.data as LocationsLoadedState).loadedLocations,
              );
            }
            if (snapshot.data is LocationsFailedState) {
              return const Center(child: Text("Error fetching locations"));
            }
            return const Text('Unknown state');
          },
        ),
      ),
    );
  }
}
