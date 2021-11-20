import 'package:flutter/material.dart';

class LocationListTileSubtitle extends StatelessWidget {
  const LocationListTileSubtitle({Key? key, required this.subtitle})
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
