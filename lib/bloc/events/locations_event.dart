abstract class LocationsEvent {}

class LocationsLoadEvent extends LocationsEvent {
  int riverId;

  LocationsLoadEvent({required this.riverId});
}
