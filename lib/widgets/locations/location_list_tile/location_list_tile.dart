import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:river_water_level/bloc/blocs/redirection_to_measurements_bloc.dart';
import 'package:river_water_level/bloc/events/redirection_to_measurements_event.dart';
import 'location_list_tile_image.dart';
import 'package:river_water_level/models/location.dart';
import 'package:river_water_level/widgets/locations/location_list_tile/location_list_tile_subtitle.dart';
import 'package:river_water_level/widgets/locations/location_list_tile/location_list_tile_title.dart';

class LocationListTile extends StatelessWidget {
  const LocationListTile({Key? key, required this.location}) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    final RedirectionToMeasurementsBloc _bloc =
        Provider.of<RedirectionToMeasurementsBloc>(context);

    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      child: ListTile(
        onTap: () {
          _bloc.inputEventSink.add(
            RedirectionToMeasurementsEvent(
              context: context,
              sensorId: location.sensorId,
            ),
          );
        },
        tileColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        leading: LocationListTileImage(imageUrl: location.imageUrl),
        title: LocationsListTileTitle(title: location.settlement),
        subtitle: LocationListTileSubtitle(
          subtitle: location.country + ", " + location.region,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 13,
          color: Color(0xffcfcfcf),
        ),
      ),
    );
  }
}
