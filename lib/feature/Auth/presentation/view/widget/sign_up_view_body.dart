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

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool visibility = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          context.go("/sign_in");
          isLoading = false;
          showSnackbar(context, state.successMessage);
        } else if (state is RegisterFailure) {
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
            appBar: CustomAppBar(title: S.of(context).sign_up),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      S.of(context).name,
                      style: AppStyles.textStyle18black,
                    ),
                    CustomTextfield(
                      hintText: S.of(context).enter_name,
                      obscureText: false,
                      controller: usernameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == "") {
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
                      controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.length < 6) {
                          return S.of(context).valid_pass;
                        } else {
                          return null;
                        }
                      },
                    ),
                    Text(
                      S.of(context).confirm_pass,
                      style: AppStyles.textStyle18black,
                    ),
                    CustomTextfield(
                      hintText: S.of(context).confirm_pass,
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
                      controller: confirmPasswordController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      buttonColor: AppColors.primaryColor,
                      width: double.infinity,
                      title: S.of(context).sign_up,
                      onTap: () {
                        if (passwordController.text ==
                            confirmPasswordController.text) {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(
                              RegisterEvent(
                                username: usernameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                          } else {
                            showSnackbar(
                                context, S.of(context).check_email_or_pass);
                          }
                        } else {
                          showSnackbar(
                              context, S.of(context).password_not_match);
                        }
                      },
                      textColor: AppColors.white,
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
                    ),
                    const SizedBox(
                      height: 30,
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
