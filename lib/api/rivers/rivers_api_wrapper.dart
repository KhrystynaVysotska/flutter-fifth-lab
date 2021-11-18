import 'package:river_water_level/api/rivers/rivers_api.dart';
import 'package:river_water_level/models/river.dart';

class RiversApiWrapper {
  final RiversApi _riverApi = RiversApi();

  Future<List<River>> getAllRivers() => _riverApi.getRivers();
}
