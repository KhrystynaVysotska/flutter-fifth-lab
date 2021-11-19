import 'package:flutter/material.dart';
import 'package:river_water_level/models/latest_measurement.dart';
import 'package:river_water_level/widgets/measurements/measurement_card/measurement_card_location.dart';
import 'package:river_water_level/widgets/measurements/measurement_card/measurement_card_timestamp.dart';
import 'package:river_water_level/widgets/measurements/measurement_card/measurement_card_value.dart';
import 'package:river_water_level/widgets/measurements/measurement_card/measurement_card_river.dart';

class MeasurementCard extends StatelessWidget {
  const MeasurementCard({Key? key, required this.measurement})
      : super(key: key);

  final LatestMeasurement measurement;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MeasurementCardRiver(river: measurement.riverName),
              MeasurementCardValue(
                isCritical: measurement.isCritical,
                maxValue: measurement.maxWaterLevel,
                actualValue: measurement.actualWaterLevel,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MeasurementCardLocation(location: measurement.locationName),
                  MeasurementCardTimestamp(timestamp: measurement.timestamp),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
