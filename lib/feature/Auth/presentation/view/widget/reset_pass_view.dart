import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:lottie/lottie.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).reset_pass),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Lottie.asset("assets/img/forget_pass.json"),
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
              hintText: S.of(context).enter_password,
              controller: TextEditingController(),
            ),
            CustomButton(
              title: S.of(context).set_pass,
              onTap: () {},
              buttonColor: AppColors.primaryColor,
              textColor: AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}
