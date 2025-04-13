import 'package:graduation_project/feature/Auth/datan/manager/auth_supabase_manager.dart';
import 'package:graduation_project/feature/Auth/datan/repository/data_source/auth_supabase_data_source_impl.dart';
import 'package:graduation_project/feature/Auth/datan/repository/repository/auth_repository_impl.dart';
import 'package:graduation_project/feature/Auth/domain/repository/data_source/auth_remote_data_source_contract.dart';
import 'package:graduation_project/feature/Auth/domain/repository/repository/auth_repository_contract.dart';
import 'package:graduation_project/feature/Auth/domain/usecase/auth_usecase.dart';

AuthUsecase injectAuthUseCase() {
  return AuthUsecase(authRepositoryContract: injectAuthRepositoryContract());
}

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoryImpl(
      authRemoteDataSourceContract: injectAuthRemoteDataSourceContract());
}

AuthRemoteDataSourceContract injectAuthRemoteDataSourceContract() {
  return AuthSupabaseDataSourceImpl(
      supabaseManager: AuthSupabaseManager.getInstance());
}
