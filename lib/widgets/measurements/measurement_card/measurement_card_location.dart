import 'package:flutter/cupertino.dart';

class MeasurementCardLocation extends StatelessWidget {
  const MeasurementCardLocation({Key? key, required this.location})
      : super(key: key);

  final String location;

  @override
  Widget build(BuildContext context) {
    return Text(
      location,
      style: const TextStyle(
        fontSize: 14,
        color: Color(0xff606064),
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
