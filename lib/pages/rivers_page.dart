import 'package:flutter/material.dart';
import 'package:river_water_level/models/river.dart';
import 'package:river_water_level/widgets/rivers/rivers_list.dart';

class RiversPage extends StatelessWidget {
  const RiversPage({Key? key, required this.rivers}) : super(key: key);

  final List<River> rivers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: RiversList(rivers: rivers)),
      ],
    );
  }
}
