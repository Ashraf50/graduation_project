import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/Auth/domain/entity/auth_result_entity.dart';
import 'package:graduation_project/feature/Auth/domain/repository/data_source/auth_remote_data_source_contract.dart';
import 'package:graduation_project/feature/Auth/domain/repository/repository/auth_repository_contract.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  AuthRemoteDataSourceContract authRemoteDataSourceContract;
  AuthRepositoryImpl({
    required this.authRemoteDataSourceContract,
  });

  @override
  Future<Either<Failure, AuthResultEntity>> login(
      {required String password, required String email, required String role}) {
    return authRemoteDataSourceContract.login(
        password: password, email: email, role: role);
  }

  @override
  Future<Either<Failure, AuthResultEntity>> register({
    required String userName,
    required String password,
    required String email,
    required String phoneNo,
    required String role,
    String? backURL,
    String? frontURL,
    File? backFile,
    File? frontFile,
  }) {
    return authRemoteDataSourceContract.register(
      userName: userName,
      password: password,
      email: email,
      phoneNo: phoneNo,
      role: role,
      backFile: backFile,
      backURL: backURL,
      frontFile: frontFile,
      frontURL: frontURL,
    );
  }

  @override
  Future<Either<Failure, String>> resetPassword({
    required String email,
  }) async {
    return authRemoteDataSourceContract.resetPassword(email: email);
  }

  @override
  Future<Either<Failure, String>> verifyOtpAndUpdatePassword({
    required String email,
    required String token,
    required String newPassword,
  }) {
    return authRemoteDataSourceContract.verifyOtpAndUpdatePassword(
      email: email,
      token: token,
      newPassword: newPassword,
    );
  }
}
