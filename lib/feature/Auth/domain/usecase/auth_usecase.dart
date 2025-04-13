import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/Auth/domain/entity/auth_result_entity.dart';
import 'package:graduation_project/feature/Auth/domain/repository/repository/auth_repository_contract.dart';

class AuthUsecase {
  AuthRepositoryContract authRepositoryContract;
  AuthUsecase({
    required this.authRepositoryContract,
  });

  Future<Either<Failure, AuthResultEntity>> register({
    required String userName,
    required String password,
    required String email,
    required String phoneNo,
    required String role,
  }) {
    return authRepositoryContract.register(
        userName: userName,
        password: password,
        email: email,
        phoneNo: phoneNo,
        role: role);
  }

  Future<Either<Failure, AuthResultEntity>> login({
    required String password,
    required String email,
    required String role,
  }) {
    return authRepositoryContract.login(
      password: password,
      email: email,
      role: role,
    );
  }
}
