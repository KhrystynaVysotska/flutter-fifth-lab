import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:river_water_level/api/constants.dart';
import 'package:river_water_level/models/river.dart';

class RiversApi {
  Future<List<River>> getRivers() async {
    final response = await http.get(Uri.parse(BASE_URL + RIVER_ENDPOINT));

    if (response.statusCode == 200) {
      final List<dynamic> riversJson = json.decode(response.body);
      return riversJson.map((json) => River.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching rivers');
    }
  }
}
