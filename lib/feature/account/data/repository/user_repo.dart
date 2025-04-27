import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/account/data/model/user_model.dart';

abstract class UserRepo {
  Future<Either<Failure, UserModel>> fetchUserData({
    required String token,
  });
  Future<Either<Failure, String>> deleteAccount({
    required String token,
  });
}
