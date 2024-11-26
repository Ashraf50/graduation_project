import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/core/widget/decoration_page.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MobileResetPasswordViewBody extends StatelessWidget {
  const MobileResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).reset_pass),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(
                width: screenWidth * 0.6,
                height: screenHeight * 0.4,
                child: Lottie.asset("assets/img/forget_pass.json")),
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
              enableColor: themeProvider.isDarkTheme
                  ? AppColors.widgetColorDark
                  : Color(0xffBCB8B1),
              hintText: S.of(context).enter_password,
              controller: TextEditingController(),
            ),
            CustomButton(
              title: S.of(context).set_pass,
              onTap: () {
                context.go("/finish_pass_view");
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

class DesktopResetPassViewBody extends StatelessWidget {
  const DesktopResetPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return CustomScaffold(
      body: DesktopDecorationPage(
        widget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              SizedBox(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.4,
                  child: Lottie.asset("assets/img/forget_pass.json")),
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
                enableColor: Color(0xffBCB8B1),
                hintText: S.of(context).enter_password,
                controller: TextEditingController(),
              ),
              CustomButton(
                title: S.of(context).set_pass,
                onTap: () {
                  context.go("/finish_pass_view");
                },
                buttonColor: AppColors.primaryColor,
                textColor: AppColors.white,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
