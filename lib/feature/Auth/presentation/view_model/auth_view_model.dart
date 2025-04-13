import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/feature/Auth/data/manager/auth_supabase_manager.dart';
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
  var tokenController = TextEditingController();
  String selectedRole = TypeOfUser.User.name;

  void register() async {
    if (formKey.currentState!.validate()) {
      if (selectedRole == 'مستخدم' || selectedRole == 'User') {
        selectedRole = TypeOfUser.User.name;
      } else {
        selectedRole = TypeOfUser.LandLord.name;
      }
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
      if (selectedRole == 'مستخدم' || selectedRole == 'User') {
        selectedRole = TypeOfUser.User.name;
      } else {
        selectedRole = TypeOfUser.LandLord.name;
      }
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

  void resetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(ResetPasswordStateLoading());
      var either = await authUseCase.resetPassword(email: emailController.text);
      either.fold((l) {
        emit(ResetPasswordStateError(errMsg: l.errMessage));
      }, (res) {
        emit(ResetPasswordStateSucces(sucMsg: res));
      });
    }
  }

  void updatePassword() async {
    if (formKey.currentState!.validate()) {
      emit(UpdatePasswordStateLoading());
      var either = await authUseCase.verifyOtpAndUpdatePassword(
        email: emailController.text,
        token: tokenController.text,
        newPassword: passwordController.text,
      );
      either.fold((l) {
        emit(UpdatePasswordStateError(errMsg: l.errMessage));
      }, (msg) {
        emit(UpdatePasswordStateSucces(sucMsg: msg));
      });
    }
  }
}
