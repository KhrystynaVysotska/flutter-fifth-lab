import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:river_water_level/bloc/blocs/alert_measurements_bloc.dart';
import 'package:river_water_level/bloc/events/alert_measurements_event.dart';
import 'package:river_water_level/models/latest_measurement.dart';
import 'package:river_water_level/widgets/measurements/alerts/alert_measurement_tile/alert_measurement_tile.dart';

class AlertMeasurementModal extends StatelessWidget {
  const AlertMeasurementModal({Key? key, required this.measurements})
      : super(key: key);

  final List<LatestMeasurement> measurements;

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<AlertMeasurementsBloc>(context);

    return AlertDialog(
        title: const Text('Підвищений рівень води:'),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        actionsPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        content: SizedBox(
          height: 250,
          width: 300,
          child: ListView(
            children: measurements
                .map((item) => AlertMeasurementItem(measurement: item))
                .toList(),
          ),
        ),
        actions: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black38),
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop(context);
              _bloc.inputEventSink.add(AlertMeasurementsClearEvent());
            },
            child: const Text('ОЧИСТИТИ'),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black87),
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop(context);
            },
            child: const Text('ЗАКРИТИ'),
          )
        ]);
  }
}
