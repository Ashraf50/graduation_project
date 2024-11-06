import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/core/widget/show_snackbar.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/check_account_widget.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/google_button.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/or_divider.dart';
import 'package:graduation_project/feature/Auth/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constant/app_theme.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
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
          context.go("/bottomBar");
          showSnackbar(context, state.successMessage);
          isLoading = false;
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnackbar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: LoadingAnimationWidget.fourRotatingDots(
            color: AppColors.primaryColor,
            size: 150,
          ),
          child: CustomScaffold(
            appBar: CustomAppBar(title: S.of(context).login),
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
                      obscureText: false,
                      controller: emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return value != null && !EmailValidator.validate(value)
                            ? S.of(context).valid_email
                            : null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      S.of(context).password,
                      style: AppStyles.textStyle18black,
                    ),
                    CustomTextfield(
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
                      height: 40,
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
                          showSnackbar(
                              context, S.of(context).check_email_or_pass);
                        }
                      },
                      textColor: AppColors.white,
                    ),
                    CustomButton(
                      buttonColor: themeProvider.isDarkTheme
                          ? AppColors.scaffoldColorDark
                          : AppColors.white,
                      title: S.of(context).guest,
                      textColor: themeProvider.isDarkTheme
                          ? AppColors.white
                          : AppColors.primaryColor,
                      onTap: () {
                        context.push('/bottomBar');
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
                    const SizedBox(
                      height: 24,
                    ),
                    const OrDivide(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GoogleButton(
                          image: "assets/img/google.svg",
                          onTap: () {},
                        ),
                        GoogleButton(
                          image: "assets/img/facebook.svg",
                          onTap: () {},
                        ),
                      ],
                    )
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
