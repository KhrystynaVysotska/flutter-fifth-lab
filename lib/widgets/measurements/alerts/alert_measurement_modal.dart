import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:river_water_level/bloc/blocs/alert_measurements_bloc.dart';
import 'package:river_water_level/bloc/events/alert_measurements_event.dart';
import 'package:river_water_level/models/latest_measurement.dart';
import 'package:river_water_level/widgets/measurements/alerts/alert_measurement_item.dart';

class AlertMeasurementModal extends StatelessWidget {
  const AlertMeasurementModal({Key? key, required this.measurements})
      : super(key: key);

  final List<LatestMeasurement> measurements;

  @override
  Widget build(BuildContext context) {
    final _alertMeasurementsBloc = Provider.of<AlertMeasurementsBloc>(context);

    return AlertDialog(
        title: const Text('Підвищений рівень води:'),
        content: SizedBox(
          height: 200,
          width: 600,
          child: ListView(
            shrinkWrap: true,
            children: measurements
                .map(
                  (measurement) => AlertMeasurementItem(
                    river: measurement.riverName,
                    location: measurement.locationName,
                    onPressed: () {
                      // TODO: navigate to measurement page
                    },
                  ),
                )
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
              _alertMeasurementsBloc.inputEventSink
                  .add(AlertMeasurementsClearEvent());
            },
            child: Text('ОЧИСТИТИ'),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black87),
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop(context);
            },
            child: Text('ЗАКРИТИ'),
          )
        ]);
  }
}
