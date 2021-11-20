import 'package:river_water_level/api/locations/locations_api.dart';
import 'package:river_water_level/models/location.dart';

class LocationsApiWrapper {
  final LocationsApi _locationsApi = LocationsApi();

  Future<List<Location>> getAllLocationsBy(int riverId) =>
      _locationsApi.getLocationsBy(riverId);
}
