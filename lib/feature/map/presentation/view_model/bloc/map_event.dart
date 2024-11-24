abstract class MapEvent {}

class LoadMap extends MapEvent {}

class SearchLocation extends MapEvent {
  final String query;
  SearchLocation({required this.query});
}

class CreateRoute extends MapEvent {
  final double endLat;
  final double endLon;
  final String means;
  CreateRoute({
    required this.endLat,
    required this.endLon,
    required this.means,
  });
}
