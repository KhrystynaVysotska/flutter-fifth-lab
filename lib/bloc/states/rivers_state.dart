import 'package:river_water_level/models/river.dart';

abstract class RiversState {}

class RiversEmptyState extends RiversState {}

class RiversLoadingState extends RiversState {}

class RiversLoadedState extends RiversState {
  List<River> loadedRivers;

  RiversLoadedState({required this.loadedRivers});
}

class RiversFailedState extends RiversState {}
