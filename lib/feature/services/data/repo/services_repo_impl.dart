import 'dart:developer';

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
    return _fetchServices(
        collectionName: 'banks', docId: '6790c82101b042b258046630');
  }

  @override
  Future<Either<Failure, List<ServicesModel>>> fetchAllCafes() {
    return _fetchServices(
        collectionName: 'cafes', docId: '6790c83f01b042b258046632');
  }

  @override
  Future<Either<Failure, List<ServicesModel>>> fetchAllHospitals() {
    return _fetchServices(
        collectionName: 'hospitals', docId: '6790c85801b042b258046634');
  }

  // @override
  // Future<Either<Failure, List<ServicesModel>>> fetchAllPharmacies() {
  //   return _fetchServices(
  //       collectionName: 'restaurants', docId: '6790c86b01b042b258046636');
  // }

  @override
  Future<Either<Failure, List<ServicesModel>>> fetchAllRestaurants() {
    return _fetchServices(
        collectionName: 'restaurants', docId: '6790c86b01b042b258046636');
  }

  Future<Either<Failure, List<ServicesModel>>> _fetchServices(
      {required String collectionName, required String docId}) async {
    try {
      final currentPosition = await locationService.getLocation();
      final lat = currentPosition.latitude;
      final long = currentPosition.longitude;
      final response = await _dio.get(
        '${AppStrings.serviceBaseUrl}/services',
        queryParameters: {
          'apiKey': AppStrings.serviceApiKey,
          'collectionName': collectionName,
          'documentId': docId,
        },
      );
      final data = response.data;
      log(" data are  ${data}");
      List<ServicesModel> placesList = (data[collectionName] as List)
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
      log(e.toString());
      return Left(ServerFailure('An unexpected error occurred.'));
    }
  }
}
