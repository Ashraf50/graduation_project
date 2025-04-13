import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/Auth/domain/entity/auth_result_entity.dart';

abstract class AuthRepositoryContract {
  Future<Either<Failure, AuthResultEntity>> register({
    required String userName,
    required String password,
    required String email,
    required String phoneNo,
    required String role,
  });
  Future<Either<Failure, AuthResultEntity>> login({
    required String password,
    required String email,
    required String role,
  });
}
