import 'package:flutter/material.dart';
import 'package:river_water_level/models/location.dart';

import 'location_list_tile/location_list_tile.dart';

class LocationsList extends StatelessWidget {
  const LocationsList({Key? key, required this.locations}) : super(key: key);

  final List<Location> locations;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) =>
            LocationListTile(location: locations[index]),
        childCount: locations.length,
      ),
    );
  }
}
