import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/helper/di.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/core/widget/custom_toast.dart';
import 'package:graduation_project/feature/Auth/data/manager/auth_supabase_manager.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/check_account_widget.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/role_button.dart';
import 'package:graduation_project/feature/Auth/presentation/view_model/auth_states.dart';
import 'package:graduation_project/feature/Auth/presentation/view_model/auth_view_model.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/constant/app_theme.dart';

class MobileSignUpViewBody extends StatefulWidget {
  const MobileSignUpViewBody({super.key});

  @override
  State<MobileSignUpViewBody> createState() => _MobileSignUpViewBodyState();
}

class _MobileSignUpViewBodyState extends State<MobileSignUpViewBody> {
  bool visibility = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    authViewModel.selectedRole = TypeOfUser.User.name;
  }

  AuthViewModel authViewModel = AuthViewModel(authUseCase: injectAuthUseCase());
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.sizeOf(context).width;

    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).sign_up),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth < 600 ? 16 : screenWidth * .15),
        child: Form(
          key: authViewModel.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoleButton(
                      selectedRole: authViewModel.selectedRole,
                      title: S.of(context).user,
                      onTap: () {
                        setState(() {
                          authViewModel.selectedRole = S.of(context).user;
                        });
                      },
                    ),
                    RoleButton(
                      selectedRole: authViewModel.selectedRole,
                      title: S.of(context).landlord,
                      onTap: () {
                        setState(() {
                          authViewModel.selectedRole = S.of(context).landlord;
                        });
                      },
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).name,
                  style: AppStyles.textStyle18black,
                ),
                CustomTextfield(
                  enableColor: themeProvider.isDarkTheme
                      ? AppColors.widgetColorDark
                      : Color(0xffBCB8B1),
                  hintText: S.of(context).enter_name,
                  obscureText: false,
                  controller: authViewModel.nameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == '') {
                      return S.of(context).value_empty;
                    } else {
                      return null;
                    }
                  },
                ),
                Text(
                  S.of(context).email,
                  style: AppStyles.textStyle18black,
                ),
                CustomTextfield(
                  enableColor: themeProvider.isDarkTheme
                      ? AppColors.widgetColorDark
                      : Color(0xffBCB8B1),
                  hintText: S.of(context).enter_email,
                  obscureText: false,
                  controller: authViewModel.emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return value != null && !EmailValidator.validate(value)
                        ? S.of(context).valid_email
                        : null;
                  },
                ),
                Text(
                  S.of(context).phone,
                  style: AppStyles.textStyle18black,
                ),
                CustomTextfield(
                  enableColor: themeProvider.isDarkTheme
                      ? AppColors.widgetColorDark
                      : Color(0xffBCB8B1),
                  hintText: S.of(context).phone,
                  obscureText: false,
                  controller: authViewModel.phoneController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.length != 11) {
                      return S.of(context).valid_phone;
                    } else {
                      return null;
                    }
                  },
                ),
                Text(
                  S.of(context).password,
                  style: AppStyles.textStyle18black,
                ),
                CustomTextfield(
                  enableColor: themeProvider.isDarkTheme
                      ? AppColors.widgetColorDark
                      : Color(0xffBCB8B1),
                  hintText: S.of(context).enter_password,
                  obscureText: visibility,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                    icon: visibility
                        ? const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          ),
                  ),
                  controller: authViewModel.passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.length < 6) {
                      return S.of(context).valid_pass;
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                authViewModel.selectedRole == 'مستخدم'
                    ? SizedBox()
                    : authViewModel.selectedRole == 'User'
                        ? SizedBox()
                        :
                        //todo: add two button to upload card image if role=> landlord
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UploadFrontIdCustomButton(
                                  authViewModel: authViewModel),
                              UploadBackIdCustomButton(
                                  authViewModel: authViewModel),
                            ],
                          ),
                BlocListener<AuthViewModel, AuthStates>(
                  bloc: authViewModel,
                  listener: (context, state) {
                    if (state is RegisterStateLoading) {
                      /// todo : show loading
                      SmartDialog.showLoading();
                    } else if (state is RegisterStateSuccess) {
                      // todo : hide loading
                      SmartDialog.dismiss();

                      // todo : show message
                      CustomToast.show(
                        message: 'Confirm Your Email to Get Started.!',
                        alignment: Alignment.bottomCenter,
                        backgroundColor: AppColors.toastColor,
                      );

                      //todo: save token
                      // SharedPreferenceUtils.saveData(
                      //   key: 'token',
                      //   value: state.authResultEntity.token,
                      // );

                      // todo: go to home page
                      context.push('/sign_in');
                    } else if (state is RegisterStateError) {
                      // todo : hide loading
                      SmartDialog.dismiss();

                      // todo : show error message
                      print('error is ${state.errorMessage}');
                      CustomToast.show(
                        message: state.errorMessage ?? '',
                        alignment: Alignment.bottomCenter,
                        backgroundColor: Colors.red,
                      );
                    } else {
                      // todo : hide loading
                      SmartDialog.dismiss();

                      // todo : show error message
                      // print('error is ${state.errorMessage}');
                      CustomToast.show(
                        message: ' state.errorMessage',
                        alignment: Alignment.bottomCenter,
                        backgroundColor: Colors.red,
                      );
                    }
                  },
                  child: CustomButton(
                    buttonColor: AppColors.primaryColor,
                    width: double.infinity,
                    title: S.of(context).sign_up,
                    onTap: () {
                      authViewModel.register();
                    },
                    textColor: AppColors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CheckedAccount(
                  title: S.of(context).already_have_account,
                  buttonTitle: S.of(context).login,
                  buttonOnTap: () {
                    context.push('/sign_in');
                  },
                ),
                SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UploadBackIdCustomButton extends StatelessWidget {
  const UploadBackIdCustomButton({
    super.key,
    required this.authViewModel,
  });

  final AuthViewModel authViewModel;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: S.of(context).upload_back,
      onTap: () async {
        final XFile? xFile = await authViewModel.pickerBack
            .pickImage(source: ImageSource.gallery);
        if (xFile != null) {
          authViewModel.backFile = File(xFile.path);
          authViewModel.backURL =
              'images/${DateTime.now().millisecondsSinceEpoch + 1}_${authViewModel.frontFile!.path.split('/').last}';
        }
      },
      width: MediaQuery.sizeOf(context).width / 2 - 20,
    );
  }
}

class UploadFrontIdCustomButton extends StatelessWidget {
  const UploadFrontIdCustomButton({
    super.key,
    required this.authViewModel,
  });

  final AuthViewModel authViewModel;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      textSize: 20,
      title: S.of(context).upload_front,
      onTap: () async {
        final XFile? xFile = await authViewModel.pickerFront
            .pickImage(source: ImageSource.gallery);
        if (xFile != null) {
          authViewModel.frontFile = File(xFile.path);

          authViewModel.frontURL =
              'images/${DateTime.now().millisecondsSinceEpoch}_${authViewModel.frontFile!.path.split('/').last}';
        }
      },
      width: MediaQuery.sizeOf(context).width / 2 - 20,
    );
  }
}
