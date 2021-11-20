import 'package:flutter/material.dart';

class AlertMeasurementTileTitle extends StatelessWidget {
  const AlertMeasurementTileTitle({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          color: Color(0xff545556),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
