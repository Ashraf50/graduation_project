import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/constant/app_strings.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/map/data/model/places_model/places_model.dart';
import 'package:graduation_project/feature/map/data/repo/map_repo.dart';
import 'package:graduation_project/feature/map/data/utils/location_service.dart';

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
      for (var place in data["items"]) {
        placesList.add(PlacesModel.fromJson(place));
      }
      return Right(placesList);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        switch (e.response?.statusCode) {
          case 400:
            return Left(
              ServerFailure("Bad request: Invalid parameters."),
            );
          case 404:
            return Left(
              ServerFailure(
                  "Not found: The requested resource could not be found."),
            );
          case 500:
            return Left(
              ServerFailure("Server error: Please try again later."),
            );
          default:
            return Left(
              ServerFailure(
                  "Unexpected server error: ${e.response?.statusCode}"),
            );
        }
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return Left(
          ServerFailure(
              "Connection timeout. Please check your network connection."),
        );
      } else if (e.type == DioExceptionType.unknown) {
        return Left(
          ServerFailure(
              "Network error: Please check your internet connection."),
        );
      }
      return Left(
        ServerFailure("An unknown error occurred."),
      );
    } catch (e) {
      return Left(
        ServerFailure("An unexpected error occurred"),
      );
    }
  }
}
