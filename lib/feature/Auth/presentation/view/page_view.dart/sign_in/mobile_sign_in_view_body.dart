import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/shared_pref.dart';
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
import 'package:provider/provider.dart';
import '../../../../../../core/constant/app_theme.dart';

class MobileSignInViewBody extends StatefulWidget {
  const MobileSignInViewBody({super.key});

  @override
  State<MobileSignInViewBody> createState() => _MobileSignInViewBodyState();
}

class _MobileSignInViewBodyState extends State<MobileSignInViewBody> {
  bool visibility = true;

  AuthViewModel authViewModel = AuthViewModel(authUseCase: injectAuthUseCase());
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    authViewModel.selectedRole = TypeOfUser.User.name;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).login),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth < 600 ? 16 : screenWidth * .15),
        child: Form(
          key: authViewModel.formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoleButton(
                    selectedRole: authViewModel.selectedRole,
                    title: S.of(context).user,
                    onTap: () {
                      authViewModel.selectedRole = S.of(context).user;

                      setState(() {});
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: authViewModel.passwordController,
                validator: (value) {
                  if (value!.length < 6) {
                    return S.of(context).valid_pass;
                  } else {
                    return null;
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      context.push('/forget_pass');
                    },
                    child: Text(
                      S.of(context).forget_pass,
                      style: themeProvider.isDarkTheme
                          ? AppStyles.textStyle18
                          : AppStyles.textStyle18green,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              BlocListener<AuthViewModel, AuthStates>(
                bloc: authViewModel,
                listener: (context, state) {
                  if (state is LoginStateLoading) {
                  
                  SmartDialog.showLoading(
                      useAnimation: true,
                      alignment: Alignment.center,
                    );
                  } else if (state is LoginStateSuccess) {
                    SmartDialog.dismiss();
                    

                    CustomToast.show(
                      message: 'You’ve Signed In Successfully!',
                      //  state.authResultEntity.user!.name ?? 'unknown',
                      alignment: Alignment.bottomCenter,
                      backgroundColor: AppColors.toastColor,
                    );

                    SharedPreferenceUtils.saveData(
                      key: 'token',
                      value: state.authResultEntity.token,
                    );
                    state.authResultEntity.user!.role == TypeOfUser.User.name
                        ? context.pushReplacement('/bottomBar')
                        : context.pushReplacement('/dashboard');
                  } else if (state is LoginStateError) {
                    SmartDialog.dismiss();
                    print('error is ${state.errorMessage}');
                    CustomToast.show(
                      message: state.errorMessage ?? '',
                      alignment: Alignment.center,
                      backgroundColor: Colors.red,
                    );
                  }
                },
                child: CustomButton(
                  buttonColor: AppColors.primaryColor,
                  title: S.of(context).login,
                  onTap: () {
                    authViewModel.login();
                  },
                  textColor: AppColors.white,
                  width: double.infinity,
                ),
              ),
              CustomButton(
                buttonColor: themeProvider.isDarkTheme
                    ? AppColors.scaffoldColorDark
                    : AppColors.white,
                title: S.of(context).guest,
                width: double.infinity,
                textColor: themeProvider.isDarkTheme
                    ? AppColors.white
                    : AppColors.primaryColor,
                onTap: () {
                  context.pushReplacement('/bottomBar');
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CheckedAccount(
                title: S.of(context).don_have_account,
                buttonTitle: S.of(context).sign_up,
                buttonOnTap: () {
                  context.push('/sign_up');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
