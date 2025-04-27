import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/account/domain/repository/data_souce/account_data_source_contrcat.dart';
import 'package:graduation_project/feature/account/domain/repository/repo/account_repo_contrcat.dart';

class AccountRepoImpl implements AccountRepoContrcat {
  AccountDataSourceContrcat accountDataSourceContract;
  AccountRepoImpl({
    required this.accountDataSourceContract,
  });
  @override
  Future<Either<Failure, String>> uploadProfileImage(
      {required String? profileImageURL,
      required File? profileImageFile}) async {
    return accountDataSourceContract.uploadProfileImage(
        profileImageURL: profileImageURL, profileImageFile: profileImageFile);
  }
}
