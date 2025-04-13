import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Auth/datan/manager/auth_supabase_manager.dart';
import 'package:graduation_project/feature/Auth/domain/usecase/auth_usecase.dart';
import 'package:graduation_project/feature/Auth/presentation/view_model/auth_states.dart';

class AuthViewModel extends Cubit<AuthStates> {
  AuthViewModel({
    required this.authUseCase,
  }) : super(AuthInitialState());

  AuthUsecase authUseCase;
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  String selectedRole = TypeOfUser.User.name;
  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterStateLoading());
      var either = await authUseCase.register(
        userName: nameController.text,
        password: passwordController.text,
        email: emailController.text,
        phoneNo: phoneController.text,
        role: selectedRole,
      );
      either.fold((ifLeft) {
        emit(RegisterStateError(errorMessage: ifLeft.errMessage));
      }, (response) {
        emit(RegisterStateSuccess(authResultEntity: response));
      });
    }
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginStateLoading());
      var either = await authUseCase.login(
        password: passwordController.text,
        email: emailController.text,
        role: selectedRole,
      );
      either.fold((l) {
        emit(LoginStateError(errorMessage: l.errMessage));
      }, (response) {
        emit(LoginStateSuccess(authResultEntity: response));
      });
    }
  }
}
