import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/generated/l10n.dart';

class AboutUSView extends StatelessWidget {
  const AboutUSView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).about),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
        child: ListView(
          children: [
            Text(
              S.of(context).about_us,
              style: AppStyles.textStyle20notBold,
            )
          ],
        ),
      ),
    );
  }
}
