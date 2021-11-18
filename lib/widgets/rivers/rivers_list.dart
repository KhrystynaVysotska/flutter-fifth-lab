import 'package:flutter/material.dart';
import 'package:river_water_level/models/river.dart';
import 'package:river_water_level/widgets/rivers/river_card/river_card.dart';

class RiversList extends StatelessWidget {
  const RiversList({Key? key, required this.rivers}) : super(key: key);

  final List<River> rivers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rivers.length,
      itemBuilder: (context, index) => RiverCard(river: rivers[index]),
    );
  }
}
