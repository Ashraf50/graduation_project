abstract class MapEvent {}

class LoadMap extends MapEvent {}

class UpdateCurrentLocation extends MapEvent {}

class SearchLocation extends MapEvent {
  final String query;
  SearchLocation({required this.query});
}
