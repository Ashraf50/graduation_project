import 'package:graduation_project/core/constant/app_strings.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/core/helper/api_helper.dart';
import 'package:graduation_project/feature/account/data/repos/user_repo.dart';
import 'package:dartz/dartz.dart';
import '../model/user_model.dart';

class UserRepoImpl implements UserRepo {
  final ApiHelper apiHelper;
  UserRepoImpl(this.apiHelper);

  @override
  Future<Either<Failure, UserModel>> fetchUserData({
    required String token,
  }) async {
    try {
      final response = await apiHelper.get(
        '${AppStrings.baseUrl}/profile',
        headers: {
          'Authorization': token,
        },
      );
      if (response.statusCode == 200) {
        final data = response.data;
        final userData = UserModel.fromJson(data);
        return Right(userData);
      } else {
        return Left(ServerFailure("failed to get data"));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
