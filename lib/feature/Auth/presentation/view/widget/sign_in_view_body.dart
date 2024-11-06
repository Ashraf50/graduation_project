import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/check_account_widget.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/google_button.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/or_divider.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constant/app_theme.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).login),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 20),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    context.push('/forget_pass');
                  },
                  child: Text(
                    S.of(context).forget_pass,
                    style: themeProvider.isDarkTheme
                        ? AppStyles.textStyle18
                        : AppStyles.textStyle18green,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              buttonColor: AppColors.primaryColor,
              title: S.of(context).login,
              onTap: () {
                context.push('/bottomBar');
              },
              textColor: AppColors.white,
            ),
            CustomButton(
              buttonColor: themeProvider.isDarkTheme
                  ? AppColors.scaffoldColorDark
                  : AppColors.white,
              title: S.of(context).guest,
              textColor: themeProvider.isDarkTheme
                  ? AppColors.white
                  : AppColors.primaryColor,
              onTap: () {},
            ),
            const SizedBox(
              height: 30,
            ),
            CheckedAccount(
              title: S.of(context).don_have_account,
              buttonTitle: S.of(context).sign_up,
              buttonOnTap: () {
                context.push('/sign_up');
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
            )
          ],
        ),
      ),
    );
  }
}
