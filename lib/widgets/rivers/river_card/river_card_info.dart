import 'package:flutter/material.dart';

class RiverCardInfo extends StatelessWidget {
  const RiverCardInfo({
    Key? key,
    required this.length,
    required this.basinArea,
  }) : super(key: key);

  final double length;
  final double basinArea;

  Row _formatRecord(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(key, style: const TextStyle(fontSize: 14)),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _formatRecord(
              "Довжина",
              length.toString() + " км",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _formatRecord(
              "Площа басейну",
              basinArea.toString() + " км²",
            ),
          ),
        ],
      ),
    );
  }
}
