import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/Auth/domain/entity/auth_result_entity.dart';
import 'package:graduation_project/feature/Auth/domain/entity/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class AuthSupabaseManager {
  AuthSupabaseManager._();
  static AuthSupabaseManager? _instance;

  static AuthSupabaseManager getInstance() {
    _instance ??= AuthSupabaseManager._();
    return _instance!;
  }

  Future<Either<Failure, AuthResultEntity>> login({
    required String password,
    required String email,
    required String role,
  }) async {
    var connectivityResults = await Connectivity().checkConnectivity();
    if (connectivityResults.contains(ConnectivityResult.mobile) ||
        connectivityResults.contains(ConnectivityResult.wifi)) {
      try {
        final response = await supabase.auth.signInWithPassword(
          password: password,
          email: email,
        );

        final user = response.user;
        if (user == null) {
          return Left(
            ServerError('Invalid email or password!'),
          );
        }
        final table = role;

        final userData =
            await supabase.from(table).select().eq('id', user.id).maybeSingle();
        if (userData == null) {
          return Left(
            ServerError('Invalid-Credetional'),
          );
        }
        return Right(
          AuthResultEntity(
            token: user.id,
            user: UserEntity(
              email: user.userMetadata?['email'] ?? email,
              name: user.userMetadata?['userName'] ?? '',
              phone: user.userMetadata?['phoneNo'] ?? '',
              role: user.userMetadata?['role'] ?? role,
            ),
          ),
        );
      } on AuthException catch (e) {
        return Left(ServerError(e.message));
      } catch (err) {
        return Left(
          ServerError(
            err.toString(),
          ),
        );
      }
    } else {
      return Left(NetworkError(
        'check your internet connection..!',
      ));
    }
  }

  Future<Either<Failure, AuthResultEntity>> register({
    required String userName,
    required String password,
    required String email,
    required String phoneNo,
    required String role,
    String? backURL,
    String? frontURL,
    File? backFile,
    File? frontFile,
  }) async {
    var connectivityResults = await Connectivity().checkConnectivity();
    if (connectivityResults.contains(ConnectivityResult.mobile) ||
        connectivityResults.contains(ConnectivityResult.wifi)) {
      try {
        print('internet is stable..');
        final response = await supabase.auth.signUp(
          password: password,
          email: email,
          data: {
            'role': role,
            'phoneNo': phoneNo,
            'userName': userName,
            'imageProfile': null,
          },
        );
        final User? user = response.user;
        if (user == null) {
          return Left(ServerError('failed to register..!'));
        }
        print('signup with email and passs is success');
        final table = role == TypeOfUser.User.name
            ? TypeOfUser.User
            : TypeOfUser.LandLord;
        final otherTable =
            table == TypeOfUser.User ? TypeOfUser.LandLord : TypeOfUser.User;
        final existingUser = await supabase
            .from(otherTable.name)
            .select('id')
            .eq('email', email)
            .maybeSingle();
        if (existingUser != null) {
          return Left(ServerError('email-already-registered-in-other-role..'));
        }
        print('email is new and success');
        String? frontImage;
        String? backImage;
        // todo: comment this line ... cause exception if it is already exist
        // await supabase.storage.createBucket('landlord-cards');

        if (role == TypeOfUser.LandLord.name) {
          print('type: landlord');
          if (frontURL != null &&
              backURL != null &&
              frontFile != null &&
              backFile != null) {
            print('full data is ok');
            //todo: upload front image
            try {
              await supabase.storage
                  .from('landlord-cards')
                  .upload(frontURL, frontFile);
              print('upload 1st image is done');
              frontImage = supabase.storage
                  .from('landlord-cards')
                  .getPublicUrl(frontURL);
              print('i got the url');
            } catch (err) {
              return Left(
                ServerError('you must upload the first image of your card..'),
              );
            }

            //todo: upload back image
            try {
              await supabase.storage
                  .from('landlord-cards')
                  .upload(backURL, backFile);
              print('upload 2nd image is done');

              backImage =
                  supabase.storage.from('landlord-cards').getPublicUrl(backURL);
              print('i got the url');
            } catch (err) {
              return Left(
                ServerError('you must upload the second image of your card..'),
              );
            }
          } else {
            return Left(
              ServerError('you must upload 2 images of your card..'),
            );
          }
        }

        try {
          if (role == TypeOfUser.LandLord.name) {
            print('type is landlord to insert table');
            await supabase.from(table.name).insert({
              'id': user.id,
              'username': user.userMetadata?['userName'] ?? userName,
              'email': user.userMetadata?['email'] ?? email,
              'phone': user.userMetadata?['phoneNo'] ?? phoneNo,
              'password': user.userMetadata?['password'] ?? password,
              'role': user.userMetadata?['role'] ?? role,
              'front_image': frontImage,
              'back_image': backImage,
            });
            print('insert land table is done');
          } else {
            print('type is User to insert table');

            await supabase.from(table.name).insert({
              'id': user.id,
              'username': user.userMetadata?['userName'] ?? userName,
              'email': user.userMetadata?['email'] ?? email,
              'phone': user.userMetadata?['phoneNo'] ?? phoneNo,
              'password': user.userMetadata?['password'] ?? password,
              'role': user.userMetadata?['role'] ?? role,
            });
            print('insert User table is done');
          }
          print('now i will return success -AuthResultEntity- ');

          return Right(
            AuthResultEntity(
              token: user.id,
              user: UserEntity(
                email: user.userMetadata?['email'] ?? email,
                name: user.userMetadata?['userName'] ?? userName,
                phone: user.userMetadata?['phoneNo'] ?? phoneNo,
                role: user.userMetadata?['role'] ?? role,
                frontURL: frontImage,
                backURL: backImage,
              ),
            ),
          );
        } on PostgrestException catch (err) {
          return Left(ServerError(err.message));
        } catch (err) {
          return Left(ServerError(err.toString()));
        }
      } catch (err) {
        return Left(ServerError(err.toString()));
      }
    } else {
      return Left(NetworkError(
        'check your internet connection..!',
      ));
    }
  }

  Future<Either<Failure, String>> resetPassword({
    required String email,
  }) async {
    var connectivityResults = await Connectivity().checkConnectivity();
    if (connectivityResults.contains(ConnectivityResult.mobile) ||
        connectivityResults.contains(ConnectivityResult.wifi)) {
      try {
        await supabase.auth.resetPasswordForEmail(email);
        return Right('Password reset email sent successfully!');
      } on AuthException catch (e) {
        return Left(ServerError(e.message));
      } catch (err) {
        return Left(ServerError(err.toString()));
      }
    } else {
      return Left(NetworkError(
        'Check your internet connection..!',
      ));
    }
  }

  Future<Either<Failure, String>> verifyOtpAndUpdatePassword({
    required String email,
    required String token, // الكود اللي وصله عالإيميل
    required String newPassword,
  }) async {
    try {
      // التحقق من OTP أولاً
      final response = await supabase.auth.verifyOTP(
        token: token,
        type: OtpType.recovery,
        email: email,
      );

      if (response.user == null) {
        return Left(ServerError('Invalid OTP or email!'));
      }

      // تحديث كلمة المرور
      await supabase.auth.updateUser(
        UserAttributes(password: newPassword),
      );

      return Right('Password updated successfully.');
    } on AuthException catch (e) {
      return Left(ServerError(e.message));
    } catch (err) {
      return Left(ServerError(err.toString()));
    }
  }
}

enum TypeOfUser {
  // ignore: constant_identifier_names
  User,
  // ignore: constant_identifier_names
  LandLord,
}
