import 'package:flutter/material.dart';
import 'package:river_water_level/models/river.dart';
import 'package:river_water_level/widgets/rivers/river_card/river_card_image.dart';
import 'package:river_water_level/widgets/rivers/river_card/river_card_info.dart';
import 'package:river_water_level/widgets/rivers/river_card/river_card_name.dart';

class RiverCard extends StatelessWidget {
  const RiverCard({Key? key, required this.river}) : super(key: key);

  final River river;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          RiverCardImage(imageUrl: river.imageUrl),
          RiverCardName(name: river.name),
          RiverCardInfo(
            length: river.length,
            basinArea: river.basinArea,
          ),
        ],
      ),
    );
  }
}
