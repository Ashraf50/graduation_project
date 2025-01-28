import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/services/data/model/servies_model.dart';
import 'package:graduation_project/feature/services/data/repo/servies_repo.dart';

class ServiesRepoImpl implements ServiceRepo {
  @override
  Future<Either<Failure, List<ServiesModel>>> fetchAllCafes(
      {required String query}) {
    throw UnimplementedError();
  }
}
