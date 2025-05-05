import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/helper/di.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/core/widget/custom_toast.dart';
import 'package:graduation_project/core/widget/decoration_page.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:graduation_project/feature/Auth/presentation/view_model/auth_states.dart';
import 'package:graduation_project/feature/Auth/presentation/view_model/auth_view_model.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MobileResetPasswordViewBody extends StatefulWidget {
  const MobileResetPasswordViewBody({super.key});

  @override
  State<MobileResetPasswordViewBody> createState() =>
      _MobileResetPasswordViewBodyState();
}

class _MobileResetPasswordViewBodyState
    extends State<MobileResetPasswordViewBody> {
  bool visibility = true;
  AuthViewModel authViewModel = AuthViewModel(authUseCase: injectAuthUseCase());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).reset_pass),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth < 600 ? 16 : screenWidth * .15),
        child: Form(
          key: authViewModel.formKey,
          child: ListView(
            children: [
              SizedBox(
                width: screenWidth * 0.6,
                height: screenHeight * 0.4,
                child: Lottie.asset(
                  'assets/img/forget_pass.json',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).reset_pass,
                style: AppStyles.textStyle24black,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                S.of(context).please_enter_your_pass,
                style: AppStyles.textStyle18gray,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextfield(
                enableColor: themeProvider.isDarkTheme
                    ? AppColors.widgetColorDark
                    : Color(0xffBCB8B1),
                hintText: 'Reset OTP.!',
                controller: authViewModel.tokenController,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextfield(
                enableColor: themeProvider.isDarkTheme
                    ? AppColors.widgetColorDark
                    : Color(0xffBCB8B1),
                hintText: S.of(context).enter_email,
                controller: authViewModel.emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  return value != null && !EmailValidator.validate(value)
                      ? S.of(context).valid_email
                      : null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextfield(
                enableColor: themeProvider.isDarkTheme
                    ? AppColors.widgetColorDark
                    : Color(0xffBCB8B1),
                hintText: 'Enter new password',
                controller: authViewModel.passwordController,
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.length < 6) {
                    return S.of(context).valid_pass;
                  } else {
                    return null;
                  }
                },
              ),
              BlocListener<AuthViewModel, AuthStates>(
                bloc: authViewModel,
                listener: (context, state) {
                  if (state is UpdatePasswordStateLoading) {
                    SmartDialog.showLoading(
                        useAnimation: true, alignment: Alignment.center);
                  } else if (state is UpdatePasswordStateError) {
                    // todo : hide loading
                    SmartDialog.dismiss();

                    // todo : show error message
                    print('error is ${state.errMsg}');
                    CustomToast.show(
                      message: state.errMsg ?? '',
                      alignment: Alignment.center,
                      backgroundColor: Colors.red,
                    );
                  } else if (state is UpdatePasswordStateSucces) {
                    SmartDialog.dismiss();
                    // todo : show message
                    CustomToast.show(
                      message: 'Reset password email sent successfully.',
                      //  state.authResultEntity.user!.name ?? 'unknown',
                      alignment: Alignment.bottomCenter,
                      backgroundColor: AppColors.toastColor,
                    );
                    context.go('/finish_pass_view');
                  }
                },
                child: CustomButton(
                  title: S.of(context).set_pass,
                  onTap: () {
                    authViewModel.updatePassword();
                    // context.go('/finish_pass_view');
                  },
                  buttonColor: AppColors.primaryColor,
                  textColor: AppColors.white,
                  width: double.infinity,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DesktopResetPassViewBody extends StatelessWidget {
  const DesktopResetPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return CustomScaffold(
      body: DesktopDecorationPage(
        widget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              SizedBox(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.4,
                  child: Lottie.asset('assets/img/forget_pass.json')),
              SizedBox(
                height: 30,
              ),
              Text(
                S.of(context).reset_pass,
                style: AppStyles.textStyle24black,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                S.of(context).please_enter_your_pass,
                style: AppStyles.textStyle18gray,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextfield(
                enableColor: Color(0xffBCB8B1),
                hintText: S.of(context).enter_password,
                controller: TextEditingController(),
              ),
              CustomButton(
                title: S.of(context).set_pass,
                onTap: () {
                  context.go('/finish_pass_view');
                },
                buttonColor: AppColors.primaryColor,
                textColor: AppColors.white,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
