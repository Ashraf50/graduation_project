import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/Auth/data/manager/auth_supabase_manager.dart';

class ProfileManagerSupabase {
  ProfileManagerSupabase._();
  static ProfileManagerSupabase? _instance;

  static ProfileManagerSupabase getInstance() {
    _instance ??= ProfileManagerSupabase._();
    return _instance!;
  }

  Future<Either<Failure, String>> uploadProfileImage({
    required String? profileImageURL,
    required File? profileImageFile,
  }) async {
    var connectivityResults = await Connectivity().checkConnectivity();
    if (connectivityResults.contains(ConnectivityResult.mobile) ||
        connectivityResults.contains(ConnectivityResult.wifi)) {
      try {
        if (profileImageURL != null && profileImageFile != null) {
          await supabase.storage
              .from('profile-image')
              .upload(profileImageURL, profileImageFile);
          print('upload 1st image is done');
          final profileIamge = supabase.storage
              .from('profile-image')
              .getPublicUrl(profileImageURL);
          print('i got the url');
          return Right(profileIamge);
        } else {
          return Left(ServerError('failed to upload image'));
        }
      } catch (err) {
        return Left(ServerError('something went wrong'));
      }
    } else {
      return Left(NetworkError('please check your internet connection'));
    }
  }
}
