import 'package:river_water_level/models/location.dart';

abstract class LocationsState {}

class LocationsEmptyState extends LocationsState {}

class LocationsLoadingState extends LocationsState {}

class LocationsLoadedState extends LocationsState {
  List<Location> loadedLocations;

  LocationsLoadedState({required this.loadedLocations});
}

class LocationsFailedState extends LocationsState {}
