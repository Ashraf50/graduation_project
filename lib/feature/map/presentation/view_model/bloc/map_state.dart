import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapState {}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapLoadingSuccess extends MapState {
  final CameraPosition cameraPosition;
  final Set<Marker> markers;
  final Set<Circle> circle;
  final Set<Polyline> polyLines;
  MapLoadingSuccess({
    required this.cameraPosition,
    required this.markers,
    required this.circle,
    required this.polyLines,
  });
}

class MapError extends MapState {
  final String errMessage;
  MapError({required this.errMessage});
}
