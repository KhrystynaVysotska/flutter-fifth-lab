import 'package:flutter/material.dart';
import 'package:river_water_level/models/location.dart';
import 'package:river_water_level/widgets/locations/locations_list.dart';
import 'package:river_water_level/widgets/common/page_header.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({Key? key, required this.locations}) : super(key: key);

  final List<Location> locations;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverToBoxAdapter(
          child: PageHeader(
            header: 'Оберіть точку заміру:',
            hasArrowBack: true,
          ),
        ),
        LocationsList(locations: locations),
      ],
    );
  }
}
