import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/services/data/model/servies_model.dart';

abstract class ServiceRepo {
  Future<Either<Failure, List<ServiesModel>>> fetchAllCafes({
    required String query,
  });
//   Future<Either<Failure, List<ServiesModel>>> fetchAllCafes({
//     required String query,
//   });Future<Either<Failure, List<ServiesModel>>> fetchAllCafes({
//     required String query,
//   });
//   Future<Either<Failure, List<ServiesModel>>> fetchAllCafes({
//     required String query,
//   });
//   Future<Either<Failure, List<ServiesModel>>> fetchAllCafes({
//     required String query,
//   });
//   Future<Either<Failure, List<ServiesModel>>> fetchAllCafes({
//     required String query,
//   });
}
