import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:river_water_level/api/constants.dart';
import 'package:river_water_level/models/location.dart';

class LocationsApi {
  Future<List<Location>> getLocationsBy(int riverId) async {
    final queryString = '?river_id=' + riverId.toString();
    final uri = Uri.parse(BASE_URL + LOCATION_ENDPOINT + queryString);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> locationsJson = json.decode(response.body);
      return locationsJson.map((json) => Location.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching locations');
    }
  }
}
