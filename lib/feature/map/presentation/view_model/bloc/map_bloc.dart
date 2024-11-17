import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
    on<SearchLocation>((event, emit) async {
      await _searchLocation(event.query, emit);
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
      final circles = {
        Circle(
          circleId: CircleId('searchedArea'),
          center:currentLocationTarget,
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
      ));
    } on LocationServiceException {
      emit(MapError(errMessage: "enable_location"));
    } on LocationPermissionException {
      emit(MapError(errMessage: "location_access"));
    } catch (e) {
      emit(MapError(errMessage: "error_location"));
    }
  }

  Future<void> _searchLocation(String query, Emitter<MapState> emit) async {
    emit(MapLoading());
    try {
      final dio = Dio();
      final response = await dio.get(
        'https://geocode.search.hereapi.com/v1/geocode',
        queryParameters: {
          'q': query,
          'apiKey': 'uUWF7IG2I4MBkruijI6cLgcAT1g-gxJ5kkIk6d8Fby4',
        },
      );
      final results = response.data['items'];
      if (results.isNotEmpty) {
        final location = results[0]['position'];
        final lat = location['lat'];
        final lng = location['lng'];
        final cameraPosition = CameraPosition(
          target: LatLng(lat, lng),
          zoom: 12,
        );
        final markers = {
          Marker(
            markerId: MarkerId('searchedLocation'),
            position: LatLng(lat, lng),
            infoWindow: InfoWindow(title: query),
          ),
        };
        final circles = {
          Circle(
            circleId: CircleId('searchedArea'),
            center: LatLng(lat, lng),
            radius: 5000,
            strokeWidth: 2,
            strokeColor: Colors.blue,
            fillColor: Colors.blue.withOpacity(0.2),
          ),
        };
        emit(MapLoadingSuccess(
          cameraPosition: cameraPosition,
          markers: markers,
          circle: circles,
        ));
      } else {
        emit(MapError(errMessage: "No results found"));
      }
    } catch (e) {
      emit(MapError(errMessage: "search_error"));
    }
  }
}
