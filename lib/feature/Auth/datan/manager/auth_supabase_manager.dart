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
  }) async {
    var connectivityResults = await Connectivity().checkConnectivity();
    if (connectivityResults.contains(ConnectivityResult.mobile) ||
        connectivityResults.contains(ConnectivityResult.wifi)) {
      try {
        final response = await supabase.auth.signUp(
          password: password,
          email: email,
          data: {
            'role': role,
            'phoneNo': phoneNo,
            'userName': userName,
          },
        );
        final User? user = response.user;
        if (user == null) {
          return Left(ServerError('failed to register..!'));
        }
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
        try {
          await supabase.from(table.name).insert({
            'id': user.id,
            'username': user.userMetadata?['userName'] ?? userName,
            'email': user.userMetadata?['email'] ?? email,
            'phone': user.userMetadata?['phoneNo'] ?? phoneNo,
            'password': user.userMetadata?['password'] ?? password,
            'role': user.userMetadata?['role'] ?? role,
          });

          return Right(
            AuthResultEntity(
              token: user.id,
              user: UserEntity(
                email: user.userMetadata?['email'] ?? email,
                name: user.userMetadata?['userName'] ?? userName,
                phone: user.userMetadata?['phoneNo'] ?? phoneNo,
                role: user.userMetadata?['role'] ?? role,
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
}

enum TypeOfUser {
  // ignore: constant_identifier_names
  User,
  // ignore: constant_identifier_names
  LandLord,
}
