import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graduation_project/feature/Auth/data/repo/auth_repo.dart';
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
          final FlutterSecureStorage secureStorage = FlutterSecureStorage();
          await secureStorage.write(
              key: 'auth_token', value: result["data"]["token"]);
        }
      } else if (event is ResetPasswordEvent) {
        emit(ResetPasswordLoading());
      }
    });
  }
}
