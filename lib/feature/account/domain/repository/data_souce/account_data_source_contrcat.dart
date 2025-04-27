import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';

abstract class AccountDataSourceContrcat {
  Future<Either<Failure, String>> uploadProfileImage({
    required String? profileImageURL,
    required File? profileImageFile,
  });
}
