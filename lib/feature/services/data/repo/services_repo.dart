import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/services/data/model/services_model.dart';

abstract class ServiceRepo {
  Future<Either<Failure, List<ServicesModel>>> fetchAllCafes();
  Future<Either<Failure, List<ServicesModel>>> fetchAllRestaurants();
  Future<Either<Failure, List<ServicesModel>>> fetchAllBanks();
  Future<Either<Failure, List<ServicesModel>>> fetchAllHospitals();
  // Future<Either<Failure, List<ServicesModel>>> fetchAllPharmacies();
}
