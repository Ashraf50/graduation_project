import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/constant/app_strings.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/core/helper/location_service.dart';
import 'package:graduation_project/feature/services/data/model/services_model.dart';
import 'package:graduation_project/feature/services/data/repo/services_repo.dart';

class ServicesRepoImpl implements ServiceRepo {
  final Dio _dio = Dio();
  final LocationService locationService = LocationService();

  @override
  Future<Either<Failure, List<ServicesModel>>> fetchAllBanks() {
    return _fetchServices('bank');
  }

  @override
  Future<Either<Failure, List<ServicesModel>>> fetchAllCafes() {
    return _fetchServices('cafe');
  }

  @override
  Future<Either<Failure, List<ServicesModel>>> fetchAllHospitals() {
    return _fetchServices('hospital');
  }

  @override
  Future<Either<Failure, List<ServicesModel>>> fetchAllPharmacies() {
    return _fetchServices('pharmacy');
  }

  @override
  Future<Either<Failure, List<ServicesModel>>> fetchAllRestaurants() {
    return _fetchServices('restaurant');
  }

  Future<Either<Failure, List<ServicesModel>>> _fetchServices(
      String type) async {
    try {
      final currentPosition = await locationService.getLocation();
      final lat = currentPosition.latitude;
      final long = currentPosition.longitude;
      final response = await _dio.get(
        '${AppStrings.serviceBaseUrl}/api/services',
        queryParameters: {
          'apiKey': AppStrings.serviceApiKey,
          'type': type,
          'lon': long,
          'lat': lat,
        },
      );
      final data = response.data;
      List<ServicesModel> placesList = (data['data'] as List)
          .map((place) => ServicesModel.fromJson(place))
          .toList();
      return Right(placesList);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        switch (e.response?.statusCode) {
          case 400:
            return Left(ServerFailure('Bad request: Invalid parameters.'));
          case 404:
            return Left(
                ServerFailure('Not found: Resource could not be found.'));
          case 500:
            return Left(ServerFailure('Server error: Please try again later.'));
          default:
            return Left(ServerFailure(
                'Unexpected server error: ${e.response?.statusCode}'));
        }
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return Left(ServerFailure('Connection timeout. Check your network.'));
      } else if (e.type == DioExceptionType.unknown) {
        return Left(
            ServerFailure('Network error. Check your internet connection.'));
      }
      return Left(ServerFailure('An unknown error occurred.'));
    } catch (e) {
      return Left(ServerFailure('An unexpected error occurred.'));
    }
  }
}
