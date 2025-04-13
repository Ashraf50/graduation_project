import 'package:graduation_project/feature/Auth/domain/entity/auth_result_entity.dart';

class AuthStates {}

class AuthInitialState extends AuthStates {}

class LoginStateLoading extends AuthStates {}

class LoginStateSuccess extends AuthStates {
  AuthResultEntity authResultEntity;
  LoginStateSuccess({required this.authResultEntity});
}

class LoginStateError extends AuthStates {
  String? errorMessage;

  LoginStateError({this.errorMessage});
}

class RegisterStateLoading extends AuthStates {}

class RegisterStateSuccess extends AuthStates {
  AuthResultEntity authResultEntity;
  RegisterStateSuccess({required this.authResultEntity});
}

class RegisterStateError extends AuthStates {
  String? errorMessage;
  RegisterStateError({this.errorMessage});
}

class ResetPasswordStateLoading extends AuthStates {}

class ResetPasswordStateError extends AuthStates {
  String? errMsg;
  ResetPasswordStateError({this.errMsg});
}

class ResetPasswordStateSucces extends AuthStates {
  String? sucMsg;
  ResetPasswordStateSucces({this.sucMsg});
}

class UpdatePasswordStateLoading extends AuthStates {}

class UpdatePasswordStateError extends AuthStates {
  String? errMsg;
  UpdatePasswordStateError({this.errMsg});
}

class UpdatePasswordStateSucces extends AuthStates {
  String? sucMsg;
  UpdatePasswordStateSucces({this.sucMsg});
}
