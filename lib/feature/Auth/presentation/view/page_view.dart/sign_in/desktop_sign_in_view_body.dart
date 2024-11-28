import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/core/widget/custom_snack_bar.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/google_button.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/or_divider.dart';
import 'package:graduation_project/feature/Auth/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:graduation_project/feature/account/presentation/view_model/user_data_cubit/user_data_cubit.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/constant/app_theme.dart';

class DesktopSignInViewBody extends StatefulWidget {
  const DesktopSignInViewBody({super.key});

  @override
  State<DesktopSignInViewBody> createState() => _DesktopSignInViewBodyState();
}

class _DesktopSignInViewBodyState extends State<DesktopSignInViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool visibility = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          context.read<UserDataCubit>().fetchUserData(state.token);
          context.go('/bottomBar');
          SnackbarHelper.showCustomSnackbar(
            context: context,
            title: S.of(context).success,
            message: state.successMessage,
            contentType: ContentType.success,
          );
          isLoading = false;
        } else if (state is LoginFailure) {
          isLoading = false;
          SnackbarHelper.showCustomSnackbar(
            context: context,
            title: S.of(context).error,
            message: state.errMessage,
            contentType: ContentType.failure,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          opacity: 0,
          inAsyncCall: isLoading,
          progressIndicator: LoadingAnimationWidget.fourRotatingDots(
            color: AppColors.primaryColor,
            size: 150,
          ),
          child: CustomScaffold(
            backgroundColor: themeProvider.isDarkTheme
                ? AppColors.widgetColorDark
                : AppColors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      S.of(context).email,
                      style: AppStyles.textStyle18black,
                    ),
                    CustomTextfield(
                      hintText: S.of(context).enter_email,
                      enableColor: Color(0xffBCB8B1),
                      obscureText: false,
                      controller: emailController,
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
                      enableColor: Color(0xffBCB8B1),
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
                      controller: passwordController,
                      validator: (value) {
                        if (value!.length < 6) {
                          return S.of(context).valid_pass;
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomButton(
                      buttonColor: AppColors.primaryColor,
                      title: S.of(context).login,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                            email: emailController.text,
                            password: passwordController.text,
                          ));
                        } else {
                          SnackbarHelper.showCustomSnackbar(
                            context: context,
                            title: S.of(context).warning,
                            message: S.of(context).check_email_or_pass,
                            contentType: ContentType.help,
                          );
                        }
                      },
                      textColor: AppColors.white,
                      width: double.infinity,
                    ),
                    CustomButton(
                      buttonColor: themeProvider.isDarkTheme
                          ? AppColors.widgetColorDark
                          : AppColors.white,
                      title: S.of(context).guest,
                      width: double.infinity,
                      textColor: themeProvider.isDarkTheme
                          ? AppColors.white
                          : AppColors.primaryColor,
                      onTap: () {
                        context.push('/bottomBar');
                      },
                    ),
                    const OrDivide(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GoogleButton(
                          image: 'assets/img/google.svg',
                          onTap: () {},
                        ),
                        GoogleButton(
                          image: 'assets/img/facebook.svg',
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
