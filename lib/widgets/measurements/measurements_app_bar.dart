import 'package:flutter/material.dart';
import 'package:river_water_level/controllers/latest_measurements_state_controller.dart';

class MeasurementsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MeasurementsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LatestMeasurementsStateController();
  }

  @override
  Size get preferredSize => const Size.fromHeight(160);
}
