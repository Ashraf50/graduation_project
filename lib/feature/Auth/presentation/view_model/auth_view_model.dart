import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/feature/Auth/data/manager/auth_supabase_manager.dart';
import 'package:graduation_project/feature/Auth/domain/usecase/auth_usecase.dart';
import 'package:graduation_project/feature/Auth/presentation/view_model/auth_states.dart';
import 'package:image_picker/image_picker.dart';

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
  ThemeProvider? theme = ThemeProvider(isDarkTheme: true);
  String? backURL;
  String? frontURL;
  File? backFile;
  File? frontFile;
  final ImagePicker pickerFront = ImagePicker();
  final ImagePicker pickerBack = ImagePicker();

  VoidCallback? frontOnPickImage;
  void register() async {
    if (formKey.currentState!.validate()) {
      if (selectedRole == 'مستخدم' || selectedRole == 'User') {
        selectedRole = TypeOfUser.User.name;
      } else {
        selectedRole = TypeOfUser.LandLord.name;
      }
      emit(RegisterStateLoading());

      ///logic is error
      ///only call register method if selectedRole is User
      if (selectedRole == TypeOfUser.LandLord.name) {
        if (frontURL == null ||
            frontFile == null ||
            backFile == null ||
            backURL == null) {
          emit(RegisterStateError(
              errorMessage: 'please upload your card images'));
        } else {
          var either1 = await authUseCase.register(
            userName: nameController.text,
            password: passwordController.text,
            email: emailController.text,
            phoneNo: phoneController.text,
            role: selectedRole,
            backFile: backFile,
            backURL: backURL,
            frontFile: frontFile,
            frontURL: frontURL,
          );
          either1.fold((ifLeft) {
            emit(RegisterStateError(errorMessage: ifLeft.errMessage));
          }, (response) {
            emit(RegisterStateSuccess(authResultEntity: response));
          });
        }
      } else {
        //selected role is User
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
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      if (selectedRole == 'مستخدم' || selectedRole == 'User') {
        selectedRole = TypeOfUser.User.name;
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
      } else {
        selectedRole = TypeOfUser.LandLord.name;
        var either = await authUseCase.login(
          password: passwordController.text,
          email: emailController.text,
          role: selectedRole,
        );

        either.fold((l) {
          emit(LoginStateError(errorMessage: l.errMessage));
        }, (response) {
          emit(LoginStateSuccess(authResultEntity: response));
        // GoRouter.of(context) .go('/home');
       
        });
      }
      emit(LoginStateLoading());
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
