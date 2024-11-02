import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/forget_password_state_image.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ForgetPasswordStateImage(
          image: 'assets/img/undraw_enter_uhqk 1.svg',
        ),
        Text(
          'forget password',
          style: AppStyles.textStyle24,
        ),
        Text(
          'Please enter your email or phone',
          style: AppStyles.textStyle16Regular,
        )
      ],
    );
  }
}
