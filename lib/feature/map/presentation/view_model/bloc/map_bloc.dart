import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/core/constant/app_strings.dart';
import 'package:graduation_project/feature/map/data/repo/map_repo.dart';
import 'package:graduation_project/feature/map/data/repo/map_repo_impl.dart';
import 'package:graduation_project/core/helper/location_service.dart';
import 'package:graduation_project/feature/map/presentation/view_model/bloc/map_event.dart';
import 'package:graduation_project/feature/map/presentation/view_model/bloc/map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final LocationService locationService;
  final CameraPosition initialCameraPosition;
  final _dio = Dio();
  final MapRepo mapRepo;

  MapBloc(this.locationService)
      : initialCameraPosition = const CameraPosition(
          target: LatLng(30.666814283311574, 30.069335102342595),
          zoom: 12,
        ),
        mapRepo = MapRepoImpl(),
        super(MapInitial()) {
    on<LoadMap>((event, emit) async {
      await _loadMap(emit);
    });
    on<SearchLocation>((event, emit) async {
      await _searchLocation(event.query, emit);
    });
    on<CreateRoute>((event, emit) async {
      await _createRoute(event.endLat, event.endLon, event.means, emit);
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
          markerId: const MarkerId('1'),
          position: currentLocationTarget,
        ),
      };
      final circles = {
        Circle(
          circleId: const CircleId('searchedArea'),
          center: currentLocationTarget,
          radius: 200,
          strokeWidth: 2,
          strokeColor: Colors.blue,
          fillColor: Colors.blue.withOpacity(0.2),
        ),
      };
      emit(MapLoadingSuccess(
          cameraPosition: cameraPosition,
          markers: markers,
          circle: circles,
          polyLines: {}));
    } on LocationServiceException {
      emit(MapError(errMessage: 'enable_location'));
    } on LocationPermissionException {
      emit(MapError(errMessage: 'location_access'));
    } catch (e) {
      emit(MapError(errMessage: 'error_location'));
    }
  }

  Future<void> _searchLocation(String query, Emitter<MapState> emit) async {
    emit(MapLoading());
    try {
      final response = await _dio.get(
        'https://geocode.search.hereapi.com/v1/geocode',
        queryParameters: {
          'q': query,
          'apiKey': AppStrings.apiKey,
        },
      );
      final currentPosition = await locationService.getLocation();
      final results = response.data['items'];
      if (results.isNotEmpty) {
        final location = results[0]['position'];
        final lat = location['lat'];
        final lng = location['lng'];
        final cameraPosition = CameraPosition(
          target: LatLng(lat, lng),
          zoom: 16,
        );
        final markers = {
          Marker(
            markerId: const MarkerId('currentLocation'),
            position:
                LatLng(currentPosition.latitude, currentPosition.longitude),
            infoWindow: InfoWindow(title: 'current'),
          ),
          Marker(
            markerId: const MarkerId('searchedLocation'),
            position: LatLng(lat, lng),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            infoWindow: InfoWindow(title: query),
          ),
        };
        final circles = {
          Circle(
            circleId: const CircleId('searchedArea'),
            center: LatLng(lat, lng),
            radius: 5000,
            strokeWidth: 2,
            strokeColor: Colors.blue,
            fillColor: Colors.blue.withOpacity(0.2),
          ),
        };
        final polyline = await _fetchRoute(
          startLat: currentPosition.latitude,
          startLon: currentPosition.longitude,
          endLat: lat,
          endLon: lng,
          profile: 'driving',
        );
        emit(MapLoadingSuccess(
          cameraPosition: cameraPosition,
          markers: markers,
          circle: circles,
          polyLines: polyline,
        ));
      } else {
        emit(MapError(errMessage: 'No results found'));
      }
    } catch (e) {
      emit(MapError(errMessage: 'search_error'));
    }
  }

  Future<void> _createRoute(double endLat, double endLon, String means,
      Emitter<MapState> emit) async {
    emit(MapLoading());
    try {
      final currentPosition = await locationService.getLocation();
      final polyline = await _fetchRoute(
        startLat: currentPosition.latitude,
        startLon: currentPosition.longitude,
        endLat: endLat,
        endLon: endLon,
        profile: means,
      );
      final markers = {
        Marker(
          markerId: const MarkerId('currentLocation'),
          position: LatLng(currentPosition.latitude, currentPosition.longitude),
          infoWindow: InfoWindow(title: 'current'),
        ),
        Marker(
          markerId: const MarkerId('searchedLocation'),
          position: LatLng(endLat, endLon),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindow: InfoWindow(title: 'Goal'),
        ),
      };
      final destination = LatLng(endLat, endLon);
      final cameraPosition = CameraPosition(
        target: destination,
        zoom: 16,
      );
      emit(MapLoadingSuccess(
        cameraPosition: cameraPosition,
        markers: markers,
        circle: {},
        polyLines: polyline,
      ));
    } catch (e) {
      emit(MapError(errMessage: 'route_error'));
    }
  }

  Future<Set<Polyline>> _fetchRoute({
    required double startLat,
    required double startLon,
    required double endLat,
    required double endLon,
    required String profile,
  }) async {
    final routePoints = await mapRepo.getRoute(
      profile: profile,
      waypoints: [
        {'lat': startLat, 'lng': startLon},
        {'lat': endLat, 'lng': endLon},
      ],
    );
    List<LatLng> polylineCoordinates =
        routePoints.map((point) => LatLng(point[0], point[1])).toList();
    return {
      Polyline(
        polylineId: const PolylineId('route1'),
        visible: true,
        points: polylineCoordinates,
        width: 5,
        color: Colors.blue,
      ),
    };
  }
}
