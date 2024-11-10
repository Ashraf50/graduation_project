import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:lottie/lottie.dart';

class FinishResetPassView extends StatelessWidget {
  const FinishResetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Lottie.asset("assets/img/check.json"),
            Center(
              child: Text(
                S.of(context).new_pass_message1,
                style: AppStyles.textStyle24black,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Center(
              child: Text(
                S.of(context).new_pass_message2,
                style: AppStyles.textStyle18gray,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            CustomButton(
              width: double.infinity,
              title: S.of(context).login,
              onTap: () {
                context.go('/sign_in');
              },
              buttonColor: AppColors.primaryColor,
              textColor: AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}
