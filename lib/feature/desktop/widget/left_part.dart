import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/custom_list_tile.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/dark_mode_button.dart';
import 'package:graduation_project/generated/l10n.dart';

class LeftPartViewBody extends StatelessWidget {
  const LeftPartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(
              height: 15,
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
          ],
        ),
      ),
    );
  }
}
