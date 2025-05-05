import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/account/data/manager/profile_manager_supabase.dart';
import 'package:graduation_project/feature/account/domain/repository/data_souce/account_data_source_contrcat.dart';

class AccountSupabaseDataSourceImpl implements AccountDataSourceContrcat {
  ProfileManagerSupabase profileManagerSupabase;
  AccountSupabaseDataSourceImpl({
    required this.profileManagerSupabase,
  });

  @override
  Future<Either<Failure, String>> uploadProfileImage(
      {required String? profileImageURL,
      required File? profileImageFile}) async {
    return profileManagerSupabase.uploadProfileImage(
        profileImageURL: profileImageURL, profileImageFile: profileImageFile);
  }
}
