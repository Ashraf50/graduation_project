import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Auth/data/repo/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  AuthBloc(this.authRepo) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is RegisterEvent) {
        emit(RegisterLoading());
        final result = await authRepo.register(
          username: event.username,
          email: event.email,
          password: event.password,
        );
        if (result["status"] == false) {
          emit(RegisterFailure(errMessage: result["message"]));
        } else if (result["status"] == true) {
          emit(RegisterSuccess(successMessage: result["message"]));
        }
      } else if (event is LoginEvent) {
        emit(LoginLoading());
        final result = await authRepo.login(
          email: event.email,
          password: event.password,
        );
        if (result["status"] == false) {
          emit(LoginFailure(errMessage: result["message"]));
        } else if (result["status"] == true) {
          emit(LoginSuccess(successMessage: result["message"]));
          SharedPreferences storeToken = await SharedPreferences.getInstance();
          await storeToken.setString('auth_token', result["data"]["token"]);
        }
      } else if (event is ResetPasswordEvent) {
        emit(ResetPasswordLoading());
      }
    });
  }
}
