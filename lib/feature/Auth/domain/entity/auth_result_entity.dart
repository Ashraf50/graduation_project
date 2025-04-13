import 'package:graduation_project/feature/Auth/domain/entity/user_entity.dart';

class AuthResultEntity {
  UserEntity? user;
  String token;
  AuthResultEntity({
    required this.token,
    required this.user,
  });
}
