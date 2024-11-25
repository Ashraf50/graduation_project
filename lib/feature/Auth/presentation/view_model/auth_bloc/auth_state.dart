part of 'auth_bloc.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {
  final String successMessage;
  RegisterSuccess({required this.successMessage});
}

final class RegisterFailure extends AuthState {
  final String errMessage;
  RegisterFailure({required this.errMessage});
}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final String successMessage;
  final String token;
  LoginSuccess({
    required this.successMessage,
    required this.token,
  });
}

final class LoginFailure extends AuthState {
  final String errMessage;
  LoginFailure({required this.errMessage});
}

final class ResetPasswordLoading extends AuthState {}

final class ResetPasswordSuccess extends AuthState {}

final class ResetPasswordFailure extends AuthState {
  final String errMessage;
  ResetPasswordFailure({required this.errMessage});
}
