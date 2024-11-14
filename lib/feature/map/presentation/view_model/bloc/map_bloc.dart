import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/feature/map/data/utils/location_service.dart';
import 'package:graduation_project/feature/map/presentation/view_model/bloc/map_event.dart';
import 'package:graduation_project/feature/map/presentation/view_model/bloc/map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final LocationService locationService;
  final CameraPosition initialCameraPosition;
  MapBloc(this.locationService)
      : initialCameraPosition = CameraPosition(
          target: LatLng(30.666814283311574, 30.069335102342595),
          zoom: 12,
        ),
        super(MapInitial()) {
    on<LoadMap>((event, emit) async {
      await _loadMap(emit);
    });
    on<UpdateCurrentLocation>((event, emit) async {
      await _loadMap(emit);
    });
  }

  Future<void> _loadMap(Emitter<MapState> emit) async {
    emit(MapLoading());
    try {
      final currentPosition = await locationService.getLocation();
      final currentLocationTarget = LatLng(
        currentPosition.latitude,
        currentPosition.longitude,
      );
      final cameraPosition = CameraPosition(
        target: currentLocationTarget,
        zoom: 16,
      );
      final markers = {
        Marker(
          markerId: MarkerId("1"),
          position: currentLocationTarget,
        ),
      };
      emit(MapLoadingSuccess(
        cameraPosition: cameraPosition,
        markers: markers,
      ));
    } on LocationServiceException {
      emit(MapError(errMessage: "enable_location"));
    } on LocationPermissionException {
      emit(MapError(errMessage: "location_access"));
    } catch (e) {
      emit(MapError(errMessage: "error_location"));
    }
  }
}
