import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/core/widget/decoration_page.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:lottie/lottie.dart';

class MobileFinishResetPassViewBody extends StatelessWidget {
  const MobileFinishResetPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth < 600 ? 16 : screenWidth * .15),
        child: ListView(
          children: [
            SizedBox(
              width: screenWidth * 0.6,
              height: screenHeight * 0.4,
              child: Lottie.asset(
                'assets/img/check.json',
                fit: BoxFit.contain,
              ),
            ),
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

class DesktopFinishPasswordViewBody extends StatelessWidget {
  const DesktopFinishPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return CustomScaffold(
      body: DesktopDecorationPage(
        widget: ListView(
          children: [
            SizedBox(
              width: screenWidth * 0.6,
              height: screenHeight * 0.4,
              child: Lottie.asset(
                'assets/img/check.json',
                fit: BoxFit.contain,
              ),
            ),
            Center(
              child: Text(
                S.of(context).new_pass_message1,
                style: AppStyles.textStyle24black,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Center(
              child: Text(
                S.of(context).new_pass_message2,
                style: AppStyles.textStyle18gray,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: CustomButton(
                width: double.infinity,
                title: S.of(context).login,
                onTap: () {
                  context.go('/sign_in');
                },
                buttonColor: AppColors.primaryColor,
                textColor: AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
