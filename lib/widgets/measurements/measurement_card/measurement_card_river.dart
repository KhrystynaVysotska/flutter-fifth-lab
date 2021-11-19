import 'package:flutter/material.dart';

class MeasurementCardRiver extends StatelessWidget {
  const MeasurementCardRiver({Key? key, required this.river}) : super(key: key);

  final String river;

  @override
  Widget build(BuildContext context) {
    return Text(
      river,
      style: const TextStyle(
        fontSize: 16,
        color: Color(0xff545556),
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
