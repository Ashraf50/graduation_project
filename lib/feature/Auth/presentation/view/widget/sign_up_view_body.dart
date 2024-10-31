import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/Auth/presentation/view/sign_in_view.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/check_account_widget.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/google_button.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/or_divider.dart';
import 'package:graduation_project/generated/l10n.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).sign_up),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
              controller: TextEditingController(),
            ),
            Text(
              S.of(context).email,
              style: AppStyles.textStyle18black,
            ),
            CustomTextfield(
              hintText: S.of(context).enter_email,
              obscureText: false,
              controller: TextEditingController(),
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
              controller: TextEditingController(),
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
              controller: TextEditingController(),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              buttonColor: AppColors.primaryColor,
              title: S.of(context).sign_up,
              onTap: () {},
              textColor: AppColors.white,
            ),
            const SizedBox(
              height: 30,
            ),
            CheckedAccount(
              title: S.of(context).already_have_account,
              buttonTitle: S.of(context).login,
              buttonOnTap: () {
                Get.to(() => const SignInView());
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
    );
  }
}
