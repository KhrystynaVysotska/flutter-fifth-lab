import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:river_water_level/bloc/events/alert_measurements_event.dart';
import 'package:river_water_level/bloc/states/alert_measurements_state.dart';
import 'alert_measurement_modal.dart';
import 'package:river_water_level/bloc/blocs/alert_measurements_bloc.dart';

class AlertMeasurementButton extends StatelessWidget {
  const AlertMeasurementButton({Key? key}) : super(key: key);

  FloatingActionButton _buildFloatingActionErrorButton(context, measurements) {
    return FloatingActionButton(
      onPressed: () {
        showDialog<void>(
            context: context,
            builder: (context) =>
                AlertMeasurementModal(measurements: measurements));
      },
      child: const Text("!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
      backgroundColor: Colors.red[400],
    );
  }

  FloatingActionButton _buildLoadingButton(context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: const Text("Оновлення..."),
      icon: const Icon(Icons.alarm),
      backgroundColor: Colors.blueGrey[400],
    );
  }

  FloatingActionButton _buildFailedButton(context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: const Text("Немає зв'язку..."),
      icon: const Icon(Icons.wifi_off),
      backgroundColor: Colors.blueGrey[400],
    );
  }

  FloatingActionButton _buildEmptyButton(context, onPressed) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.check),
      backgroundColor: Colors.green[400],
    );
  }

  FloatingActionButton _buildClearedButton(context, onPressed) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.youtube_searched_for_outlined),
      backgroundColor: Colors.blueGrey[400],
    );
  }

  void loadAlerts(AlertMeasurementsBloc bloc) {
    bloc.inputEventSink.add(AlertMeasurementsLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    final _alertMeasurementsBloc = Provider.of<AlertMeasurementsBloc>(context);

    return StreamBuilder(
      stream: _alertMeasurementsBloc.outputStateStream,
      initialData: _alertMeasurementsBloc.initialState,
      builder: (context, snapshot) {
        if (snapshot.data is AlertMeasurementsEmptyState) {
          return _buildEmptyButton(
            context,
            () => loadAlerts(_alertMeasurementsBloc),
          );
        }
        if (snapshot.data is AlertMeasurementsLoadingState) {
          return _buildLoadingButton(context);
        }
        if (snapshot.data is AlertMeasurementsLoadedState) {
          return _buildFloatingActionErrorButton(
            context,
            (snapshot.data as AlertMeasurementsLoadedState)
                .loadedAlertMeasurements,
          );
        }
        if (snapshot.data is AlertMeasurementsFailedState) {
          loadAlerts(_alertMeasurementsBloc);
          return _buildFailedButton(context);
        }
        if (snapshot.data is AlertMeasurementsClearedState) {
          return _buildClearedButton(
            context,
            () => loadAlerts(_alertMeasurementsBloc),
          );
        }
        return const Text('Unknown state');
      },
    );
  }
}
