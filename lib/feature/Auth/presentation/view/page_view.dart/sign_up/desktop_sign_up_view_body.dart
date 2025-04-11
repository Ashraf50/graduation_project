import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/core/widget/custom_toast.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:graduation_project/feature/Auth/presentation/view_model/auth_bloc/auth_bloc.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/constant/app_theme.dart';

class DesktopSignUpViewBody extends StatefulWidget {
  const DesktopSignUpViewBody({super.key});

  @override
  State<DesktopSignUpViewBody> createState() => _DesktopSignUpViewBodyState();
}

class _DesktopSignUpViewBodyState extends State<DesktopSignUpViewBody> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          SmartDialog.showLoading();
        } else if (state is RegisterSuccess) {
          context.go('/sign_in');
          CustomToast.show(
            message: state.successMessage,
            alignment: Alignment.topCenter,
            backgroundColor: AppColors.toastColor,
          );
          SmartDialog.dismiss();
        } else if (state is RegisterFailure) {
          SmartDialog.dismiss();
          CustomToast.show(
            message: state.errMessage,
            backgroundColor: Colors.red,
          );
        }
      },
      builder: (context, state) {
        return CustomScaffold(
          backgroundColor: themeProvider.isDarkTheme
              ? AppColors.widgetColorDark
              : AppColors.white,
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
                    enableColor: Color(0xffBCB8B1),
                    obscureText: false,
                    controller: usernameController,
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
                    enableColor: Color(0xffBCB8B1),
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
                  Text(
                    S.of(context).phone,
                    style: AppStyles.textStyle18black,
                  ),
                  CustomTextfield(
                    enableColor: Color(0xffBCB8B1),
                    hintText: S.of(context).phone,
                    obscureText: false,
                    controller: phoneController,
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
                    hintText: S.of(context).enter_password,
                    enableColor: Color(0xffBCB8B1),
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
                    enableColor: Color(0xffBCB8B1),
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
                                phone: phoneController.text,
                                role: 'user'),
                          );
                        } else {
                          CustomToast.show(
                            message: S.of(context).check_email_or_pass,
                          );
                        }
                      } else {
                        CustomToast.show(
                          message: S.of(context).password_not_match,
                        );
                      }
                    },
                    textColor: AppColors.white,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
