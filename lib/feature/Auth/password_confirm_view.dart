import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/Auth/presentation/view/otp_view.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/forget_password_state_image.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/title_and_sub_widget.dart';

import '../../core/constant/app_style.dart';
import '../../core/widget/custom_button.dart';
import '../../generated/l10n.dart';

class PasswordConfirmView extends StatelessWidget {
  const PasswordConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 88),
            const CustomImageWidget(
              image: 'assets/img/passwordConfirm.svg',
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 24),
              child: TitleAndSubWidget(
                title: 'New Password Has Been Set',
                subTitle: "Your password has been updated Successfully",
              ),
            ),
            const Spacer(),
            CustomButton(
              title: 'Set Password',
              onTap: () {
                Get.to(() => const OtpView());
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
