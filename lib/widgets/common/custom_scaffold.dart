import 'package:flutter/material.dart';
import 'package:river_water_level/widgets/measurements/measurements_app_bar.dart';
import 'package:river_water_level/controllers/alert_measurements_state_controller.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      appBar: const MeasurementsAppBar(),
      backgroundColor: Theme.of(context).primaryColor,
      floatingActionButton: const AlertMeasurementsStateController(),
    );
  }
}
