import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/account/domain/repository/repo/account_repo_contrcat.dart';

class UploadImageUsecase {
  AccountRepoContrcat accountRepoContrcat;
  UploadImageUsecase({
    required this.accountRepoContrcat,
  });
  Future<Either<Failure, String>> uploadProfileImage({
    required String? profileImageURL,
    required File? profileImageFile,
  }) async {
    return accountRepoContrcat.uploadProfileImage(
        profileImageURL: profileImageURL, profileImageFile: profileImageFile);
  }
}
