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
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:graduation_project/feature/Auth/presentation/view_model/auth_states.dart';
import 'package:graduation_project/feature/Auth/presentation/view_model/auth_view_model.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MobileForgetPasswordViewBody extends StatelessWidget {
  MobileForgetPasswordViewBody({super.key});
  AuthViewModel authViewModel = AuthViewModel(authUseCase: injectAuthUseCase());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).forget_password),
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
                height: 30,
              ),
              Text(
                S.of(context).forget_password,
                style: AppStyles.textStyle24black,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                S.of(context).please_enter_your_email,
                style: AppStyles.textStyle18gray,
              ),
              SizedBox(
                height: 30,
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
              BlocListener<AuthViewModel, AuthStates>(
                bloc: authViewModel,
                listener: (context, state) {
                  if (state is ResetPasswordStateLoading) {
                    SmartDialog.showLoading(
                        useAnimation: true, alignment: Alignment.center);
                  } else if (state is ResetPasswordStateError) {
                    // todo : hide loading
                    SmartDialog.dismiss();

                    // todo : show error message
                    print('error is ${state.errMsg}');
                    CustomToast.show(
                      message: state.errMsg ?? '',
                      alignment: Alignment.center,
                      backgroundColor: Colors.red,
                    );
                  } else if (state is ResetPasswordStateSucces) {
                    SmartDialog.dismiss();

                    // todo : show message
                    CustomToast.show(
                      message: 'Reset password email sent successfully.',
                      //  state.authResultEntity.user!.name ?? 'unknown',
                      alignment: Alignment.bottomCenter,
                      backgroundColor: AppColors.toastColor,
                    );
                    context.push('/reset_pass');
                  }
                },
                child: CustomButton(
                  title: S.of(context).next,
                  onTap: () {
                    authViewModel.resetPassword();
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
