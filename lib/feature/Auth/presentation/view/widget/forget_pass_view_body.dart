import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:lottie/lottie.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).forget_password),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Lottie.asset("assets/img/forget_pass.json"),
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
              hintText: S.of(context).enter_email,
              controller: TextEditingController(),
            ),
            CustomButton(
              title: S.of(context).next,
              onTap: () {
                context.push("/reset_pass");
              },
              buttonColor: AppColors.primaryColor,
              textColor: AppColors.white,
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }
}
