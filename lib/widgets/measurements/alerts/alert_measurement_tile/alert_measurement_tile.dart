import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:river_water_level/models/latest_measurement.dart';
import 'package:river_water_level/bloc/blocs/redirection_to_measurements_bloc.dart';
import 'package:river_water_level/bloc/events/redirection_to_measurements_event.dart';
import 'package:river_water_level/widgets/measurements/alerts/alert_measurement_tile/alert_measurement_tile_subtitle.dart';
import 'package:river_water_level/widgets/measurements/alerts/alert_measurement_tile/alert_measurement_tile_title.dart';

class AlertMeasurementItem extends StatelessWidget {
  const AlertMeasurementItem({Key? key, required this.measurement})
      : super(key: key);

  final LatestMeasurement measurement;

  @override
  Widget build(BuildContext context) {
    final _redirectionBloc =
        Provider.of<RedirectionToMeasurementsBloc>(context);
    return ListTile(
      onTap: () => {
        _redirectionBloc.inputEventSink.add(
          RedirectionToMeasurementsEvent(
            context: context,
            sensorId: measurement.sensorId,
          ),
        )
      },
      leading: Icon(Icons.location_on, size: 35.0, color: Colors.red[400]),
      title: AlertMeasurementTileTitle(title: measurement.riverName),
      subtitle:
          AlertMeasurementTileSubtitle(subtitle: measurement.locationName),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 13,
        color: Color(0xffcfcfcf),
      ),
    );
  }
}
