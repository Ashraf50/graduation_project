import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/forget_password_custom_text_feild.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/forget_password_state_image.dart';

import '../../../../../core/widget/custom_button.dart';
import '../../../../../generated/l10n.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 108,
          ),
          const ForgetPasswordStateImage(
            image: 'assets/img/undraw_forgot_password_re_hxwm 1.svg',
          ),
          const SizedBox(height: 64),
          Text(
            S.of(context).forget_pass,
            style: AppStyles.textStyle24,
          ),
          const SizedBox(height: 16),
          const Text(
            "Please Enter your email or phone ",
            style: AppStyles.textStyle16Regular,
          ),
          const SizedBox(height: 16 * 2),
          const ForgetPasswordCustomTextFeild(),
          const SizedBox(height: 40),
          CustomButton(
            title: 'Send',
            onTap: () {},
            buttonColor: AppColors.primaryColor,
            textColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}
