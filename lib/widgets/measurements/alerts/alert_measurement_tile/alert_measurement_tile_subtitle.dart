import 'package:flutter/material.dart';

class AlertMeasurementTileSubtitle extends StatelessWidget {
  const AlertMeasurementTileSubtitle({Key? key, required this.subtitle})
      : super(key: key);

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: const TextStyle(
        fontSize: 14,
        color: Color(0xff606064),
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
