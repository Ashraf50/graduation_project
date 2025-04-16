import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/Auth/domain/entity/auth_result_entity.dart';

abstract class AuthRemoteDataSourceContract {
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
  });
  Future<Either<Failure, AuthResultEntity>> login({
    required String password,
    required String email,
    required String role,
  });
  Future<Either<Failure, String>> resetPassword({
    required String email,
  });
  Future<Either<Failure, String>> verifyOtpAndUpdatePassword({
    required String email,
    required String token, // الكود اللي وصله عالإيميل
    required String newPassword,
  });
}
