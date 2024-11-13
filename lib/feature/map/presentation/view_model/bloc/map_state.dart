import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapState {}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapLoadingSuccess extends MapState {
  final CameraPosition cameraPosition;
  final Set<Marker> markers;
  MapLoadingSuccess({
    required this.cameraPosition,
    required this.markers,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MapLoadingSuccess &&
          runtimeType == other.runtimeType &&
          cameraPosition == other.cameraPosition &&
          markers == other.markers;

  @override
  int get hashCode => cameraPosition.hashCode ^ markers.hashCode;
}

class MapError extends MapState {
  final String errMessage;
  MapError({required this.errMessage});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MapError &&
          runtimeType == other.runtimeType &&
          errMessage == other.errMessage;
  @override
  int get hashCode => errMessage.hashCode;
}
