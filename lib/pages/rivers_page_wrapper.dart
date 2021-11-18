import 'package:flutter/material.dart';
import 'package:river_water_level/bloc/blocs/rivers_bloc.dart';
import 'package:river_water_level/bloc/events/rivers_event.dart';
import 'package:river_water_level/bloc/states/rivers_state.dart';
import 'package:river_water_level/pages/rivers_page.dart';

class RiversPageWrapper extends StatefulWidget {
  const RiversPageWrapper({Key? key}) : super(key: key);

  @override
  _RiversPageWrapperState createState() => _RiversPageWrapperState();
}

class _RiversPageWrapperState extends State<RiversPageWrapper> {
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
      backgroundColor: const Color(0xfffdf9f5),
      body: StreamBuilder(
        stream: _riversBloc.outputStateStream,
        initialData: _riversBloc.initialState,
        builder: (context, snapshot) {
          if (snapshot.data is RiversEmptyState) {
            return const Center(
              child: Text("No data received", style: TextStyle(fontSize: 20)),
            );
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
            return const Center(
              child:
                  Text("Error fetching rivers", style: TextStyle(fontSize: 20)),
            );
          }
          return const Text('Unknown state');
        },
      ),
    );
  }
}
