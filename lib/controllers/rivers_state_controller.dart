import 'package:flutter/material.dart';
import 'package:river_water_level/bloc/blocs/rivers_bloc.dart';
import 'package:river_water_level/bloc/events/rivers_event.dart';
import 'package:river_water_level/bloc/states/rivers_state.dart';
import 'package:river_water_level/controllers/alert_measurements_state_controller.dart';
import 'package:river_water_level/pages/rivers_page.dart';

class RiversStateController extends StatefulWidget {
  const RiversStateController({Key? key}) : super(key: key);

  @override
  _RiversStateControllerState createState() => _RiversStateControllerState();
}

class _RiversStateControllerState extends State<RiversStateController> {
  final RiversBloc _riversBloc = RiversBloc();

  @override
  void initState() {
    super.initState();
    _riversBloc.inputEventSink.add(RiversLoadEvent());
  }

  @override
  void dispose() {
    _riversBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: StreamBuilder(
          stream: _riversBloc.outputStateStream,
          initialData: _riversBloc.initialState,
          builder: (context, snapshot) {
            if (snapshot.data is RiversEmptyState) {
              return const Center(child: Text("No data received"));
            }
            if (snapshot.data is RiversLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.data is RiversLoadedState) {
              return RiversPage(
                rivers: (snapshot.data as RiversLoadedState).loadedRivers,
              );
            }
            if (snapshot.data is RiversFailedState) {
              return const Center(child: Text("Error fetching rivers"));
            }
            return const Text('Unknown state');
          },
        ),
      ),
      floatingActionButton: const AlertMeasurementsStateController(),
    );
  }
}
