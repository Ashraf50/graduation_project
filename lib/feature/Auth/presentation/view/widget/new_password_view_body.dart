import 'package:flutter/material.dart';

import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/feature/Auth/password_confirm_view.dart';

import '../../../../../core/constant/app_style.dart';
import '../../../../../generated/l10n.dart';
import 'forget_password_custom_text_feild.dart';

class NewPasswordViewBody extends StatelessWidget {
  const NewPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 200,
          ),
          Text(
            S.of(context).forget_pass,
            style: AppStyles.textStyle24black,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Please Enter the New Passoword ",
            style: AppStyles.textStyle16Regular,
          ),
          const SizedBox(
            height: 16 * 2,
          ),
          const ForgetPasswordCustomTextFeild(
            obscureText: true,
          ),
          const SizedBox(
            height: 64,
          ),
          CustomButton(
            title: 'Set Password',
            onTap: () {
              // Get.to(() => const PasswordConfirmView());
            },
          )
        ],
      ),
    );
  }
}
