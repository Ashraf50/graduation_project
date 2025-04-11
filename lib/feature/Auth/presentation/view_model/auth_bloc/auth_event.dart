part of 'auth_bloc.dart';

abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;
  final String phone;
  final String role;
  RegisterEvent({
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
    required this.role,
  });
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent({
    required this.email,
    required this.password,
  });
}

class ResetPasswordEvent extends AuthEvent {}
