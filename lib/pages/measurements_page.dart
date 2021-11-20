import 'package:flutter/material.dart';
import 'package:river_water_level/models/measurement.dart';
import 'package:river_water_level/widgets/measurements/measurements_table.dart';

class MeasurementsPage extends StatelessWidget {
  const MeasurementsPage({Key? key, required this.measurements})
      : super(key: key);

  final List<Measurement> measurements;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MeasurementsTable(measurements: measurements),
    );
  }
}
