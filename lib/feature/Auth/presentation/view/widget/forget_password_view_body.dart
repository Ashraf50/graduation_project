import 'package:flutter/material.dart';
<<<<<<< HEAD
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
=======
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/feature/Auth/presentation/view/new_password_view.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/forget_password_custom_text_feild.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/forget_password_state_image.dart';

import '../../../../../core/widget/custom_button.dart';
import '../../../../../generated/l10n.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 108,
          ),
          const CustomImageWidget(
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
            onTap: () {
              Get.to(() => const NewPasswordView());
            },
            buttonColor: AppColors.primaryColor,
            textColor: AppColors.white,
          ),
        ],
>>>>>>> ibrahim
      ),
    );
  }
}
