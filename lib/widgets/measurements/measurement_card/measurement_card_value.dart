import 'package:flutter/material.dart';

class MeasurementCardValue extends StatelessWidget {
  const MeasurementCardValue({
    Key? key,
    required this.maxValue,
    required this.isCritical,
    required this.actualValue,
  }) : super(key: key);

  final bool isCritical;
  final double maxValue;
  final double actualValue;

  final Color _valueNormalColor = const Color(0xff617e8d);
  final Color _valueAlertColor = const Color(0xff8a6a6a);

  final Color _boxNormalColor = const Color(0xffe1eef7);
  final Color _boxAlertColor = const Color(0xfffeeceb);

  Text _formatActualValue(double value) {
    return Text(
      value.toString() + " м",
      style: const TextStyle(
        fontSize: 20,
        color: Color(0xff3c404a),
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Container _formatMaxValue(
    double actualValue,
    double maxValue,
    bool isCritical,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: isCritical ? _boxAlertColor : _boxNormalColor,
      ),
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Text(
        maxValue.toString() + " м",
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isCritical ? _valueAlertColor : _valueNormalColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _formatActualValue(actualValue),
        _formatMaxValue(actualValue, maxValue, isCritical),
      ],
    );
  }
}
