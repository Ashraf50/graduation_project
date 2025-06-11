import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/constant/shared_pref.dart';
import 'package:graduation_project/core/helper/di.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/account_header_content.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/custom_list_tile.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/dark_mode_button.dart';
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
            IconButton(
              onPressed: () async {
                context.go('/sign_in');
                await supabase.auth.signOut();
                SharedPreferenceUtils.removeDate(key: 'token');
              },
              icon: Icon(
                Icons.logout,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AccountHeaderContent(),
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
              image: 'assets/img/language.svg',
              onTap: () {
                context.push('/language');
              },
            ),
            CustomListTile(
              title: S.of(context).rate,
              image: 'assets/img/rate.svg',
              onTap: () {},
            ),
            CustomListTile(
              title: S.of(context).contact,
              image: 'assets/img/contact.svg',
              onTap: () {
                context.push('/contact_us');
              },
            ),
            CustomListTile(
              title: S.of(context).terms,
              image: 'assets/img/terms.svg',
              onTap: () {
                context.push('/terms');
              },
            ),
            CustomListTile(
              title: S.of(context).privacy,
              image: 'assets/img/policy.svg',
              onTap: () {
                context.push('/privacy');
              },
            ),
            CustomListTile(
              title: S.of(context).about,
              image: 'assets/img/about.svg',
              onTap: () {
                context.push('/about_us');
              },
            ),

            //  context.go('/sign_in');
            //   await supabase.auth.signOut();
            //   SharedPreferenceUtils.removeDate(key: 'token');
          ],
        ),
      ),
    );
  }
}
