import 'package:graduation_project/feature/Auth/data/manager/auth_supabase_manager.dart';
import 'package:graduation_project/feature/Auth/data/repository/data_source/auth_supabase_data_source_impl.dart';
import 'package:graduation_project/feature/Auth/data/repository/repository/auth_repository_impl.dart';
import 'package:graduation_project/feature/Auth/domain/repository/data_source/auth_remote_data_source_contract.dart';
import 'package:graduation_project/feature/Auth/domain/repository/repository/auth_repository_contract.dart';
import 'package:graduation_project/feature/Auth/domain/usecase/auth_usecase.dart';
import 'package:graduation_project/feature/account/data/manager/profile_manager_supabase.dart';
import 'package:graduation_project/feature/account/data/repository/data_source/account_supabase_data_source_impl.dart';
import 'package:graduation_project/feature/account/data/repository/repo/account_repo_impl.dart';
import 'package:graduation_project/feature/account/domain/repository/data_souce/account_data_source_contrcat.dart';
import 'package:graduation_project/feature/account/domain/repository/repo/account_repo_contrcat.dart';
import 'package:graduation_project/feature/account/domain/usecase/upload_image_usecase.dart';
import 'package:graduation_project/feature/flat/data/repository/repo/flat_repo_impl.dart';
import 'package:graduation_project/feature/flat/domain/repository/repo/flat_repo_contract.dart';
import 'package:graduation_project/feature/flat/presentation/view_model/flat_view_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../feature/flat/data/manager/flat_supabase_manager.dart';
import '../../feature/flat/data/repository/data_source/flat_supabase_data_source_impl.dart';
import '../../feature/flat/domain/use_case/add_flat_with_image_use_case.dart';

final supabase = Supabase.instance.client;

UploadImageUsecase injectUploadImageUsecase() {
  return UploadImageUsecase(accountRepoContrcat: injectAccountRepoContrcat());
}

AccountRepoContrcat injectAccountRepoContrcat() {
  return AccountRepoImpl(
      accountDataSourceContract: injectAccountDataSourceContrcat());
}

AccountDataSourceContrcat injectAccountDataSourceContrcat() {
  return AccountSupabaseDataSourceImpl(
      profileManagerSupabase: ProfileManagerSupabase.getInstance());
}

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

