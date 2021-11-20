import 'package:flutter/material.dart';

class MeasurementCardTimestamp extends StatelessWidget {
  const MeasurementCardTimestamp({Key? key, required this.timestamp})
      : super(key: key);

  final String timestamp;

  String _formatTimestamp(String timestamp) {
    // Example input: 2021-11-17T09:52:54
    // Example output: 17/11 09:52

    List<String> dateTime = timestamp.split('T');

    List<String> date = dateTime[0].split('-');
    List<String> time = dateTime[1].split(':');

    return date[2] + "/" + date[1] + " " + time[0] + ":" + time[1];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Text(
        _formatTimestamp(timestamp),
        style: const TextStyle(fontSize: 11, color: Color(0xff606064)),
      ),
    );
  }
}
