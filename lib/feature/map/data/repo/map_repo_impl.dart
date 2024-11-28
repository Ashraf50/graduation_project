import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:graduation_project/core/constant/app_strings.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/map/data/model/places_model/places_model.dart';
import 'package:graduation_project/feature/map/data/repo/map_repo.dart';
import 'package:graduation_project/core/helper/location_service.dart';

class MapRepoImpl implements MapRepo {
  final Dio _dio = Dio();
  final LocationService locationService = LocationService();
  @override
  Future<Either<Failure, List<PlacesModel>>> fetchAllPlaces(
      {required String query}) async {
    try {
      final currentPosition = await locationService.getLocation();
      final lat = currentPosition.latitude;
      final long = currentPosition.longitude;
      final response = await _dio.get(
        'https://discover.search.hereapi.com/v1/discover',
        queryParameters: {
          'q': query,
          'at': '$lat,$long',
          'apiKey': AppStrings.apiKey,
        },
      );
      final data = response.data;
      List<PlacesModel> placesList = [];
      for (var place in data['items']) {
        placesList.add(PlacesModel.fromJson(place));
      }
      return Right(placesList);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        switch (e.response?.statusCode) {
          case 400:
            return Left(
              ServerFailure('Bad request: Invalid parameters.'),
            );
          case 404:
            return Left(
              ServerFailure(
                  'Not found: The requested resource could not be found.'),
            );
          case 500:
            return Left(
              ServerFailure('Server error: Please try again later.'),
            );
          default:
            return Left(
              ServerFailure(
                  'Unexpected server error: ${e.response?.statusCode}'),
            );
        }
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return Left(
          ServerFailure(
              'Connection timeout. Please check your network connection.'),
        );
      } else if (e.type == DioExceptionType.unknown) {
        return Left(
          ServerFailure(
              'Network error: Please check your internet connection.'),
        );
      }
      return Left(
        ServerFailure('An unknown error occurred.'),
      );
    } catch (e) {
      return Left(
        ServerFailure('An unexpected error occurred'),
      );
    }
  }

  @override
  Future<List<List<double>>> getRoute({
    required String profile,
    required List<Map<String, double>> waypoints,
  }) async {
    try {
      final coordinates =
          waypoints.map((point) => "${point['lng']},${point['lat']}").join(';');
      final url =
          'https://router.project-osrm.org/route/v1/$profile/$coordinates';
      final queryParams = {
        'overview': 'full',
        'steps': 'true',
      };
      final response = await _dio.get(url, queryParameters: queryParams);
      if (response.statusCode == 200) {
        final data = response.data;
        PolylinePoints polylinePoints = PolylinePoints();
        final encodedPolyline = data['routes'][0]['geometry'];
        List<PointLatLng> result =
            polylinePoints.decodePolyline(encodedPolyline);
        List<List<double>> decodedPolylinePoints = result
            .map(
              (e) => [e.latitude, e.longitude],
            )
            .toList();
        return decodedPolylinePoints;
      } else {
        throw Exception('Failed to fetch route: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return Future.error('Server error: ${e.response?.data}');
      } else if (e.type == DioExceptionType.connectionTimeout) {
        return Future.error('Connection timeout. Please try again later.');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return Future.error('The server took too long to respond.');
      } else if (e.type == DioExceptionType.unknown) {
        return Future.error('An unexpected error occurred: ${e.message}');
      } else {
        return Future.error('Unknown error occurred: ${e.message}');
      }
    } catch (e) {
      return Future.error('Failed to load route: ${e.toString()}');
    }
  }
}
