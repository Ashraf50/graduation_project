import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/about_us_view.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/account_header_content.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/custom_list_tile.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/dark_mode_button.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/language_view.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:provider/provider.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).Account),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            AccountHeaderContent(onTap: () {}),
            SizedBox(
              height: 24,
            ),
            Divider(
              color: themeProvider.isDarkTheme
                  ? AppColors.widgetColorDark
                  : AppColors.whiteGrey,
              thickness: 4,
            ),
            SizedBox(
              height: 8,
            ),
            DarkModeButton(),
            SizedBox(
              height: 8,
            ),
            CustomListTile(
              title: S.of(context).language,
              image: "assets/img/language.svg",
              onTap: () {
                Get.to(() => LanguageView());
              },
            ),
            CustomListTile(
              title: S.of(context).rate,
              image: "assets/img/rate.svg",
              onTap: () {},
            ),
            CustomListTile(
              title: S.of(context).contact,
              image: "assets/img/contact.svg",
              onTap: () {},
            ),
            CustomListTile(
              title: S.of(context).terms,
              image: "assets/img/terms.svg",
              onTap: () {},
            ),
            CustomListTile(
              title: S.of(context).privacy,
              image: "assets/img/policy.svg",
              onTap: () {},
            ),
            CustomListTile(
              title: S.of(context).about,
              image: "assets/img/about.svg",
              onTap: () {
                Get.to(() => AboutUSView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
