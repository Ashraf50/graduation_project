import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/Auth/datan/manager/auth_supabase_manager.dart';
import 'package:graduation_project/feature/Auth/domain/entity/auth_result_entity.dart';
import 'package:graduation_project/feature/Auth/domain/repository/data_source/auth_remote_data_source_contract.dart';

class AuthSupabaseDataSourceImpl implements AuthRemoteDataSourceContract {
  AuthSupabaseManager supabaseManager;
  AuthSupabaseDataSourceImpl({
    required this.supabaseManager,
  });

  @override
  Future<Either<Failure, AuthResultEntity>> login({
    required String password,
    required String email,
    required String role,
  }) async {
    return await supabaseManager.login(
      password: password,
      email: email,
      role: role,
    );
  }

  @override
  Future<Either<Failure, AuthResultEntity>> register({
    required String userName,
    required String password,
    required String email,
    required String phoneNo,
    required String role,
  }) async {
    return await supabaseManager.register(
        userName: userName,
        password: password,
        email: email,
        phoneNo: phoneNo,
        role: role);
  }
}
