import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/generated/l10n.dart';

class PrivacyAndPolicy extends StatelessWidget {
  const PrivacyAndPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).privacy),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
        child: ListView(
          children: [
            Text(
              S.of(context).policy_thanks,
              style: AppStyles.textStyle20notBold,
            ),
            Text(
              S.of(context).policy1,
              style: AppStyles.textStyle24blackBold,
            ),
            Text(
              S.of(context).policy1_desc,
              style: AppStyles.textStyle20notBold,
            ),
            Text(
              S.of(context).policy2,
              style: AppStyles.textStyle24blackBold,
            ),
            Text(
              S.of(context).policy2_desc,
              style: AppStyles.textStyle20notBold,
            ),
            Text(
              S.of(context).policy3,
              style: AppStyles.textStyle24blackBold,
            ),
            Text(
              S.of(context).policy3_desc,
              style: AppStyles.textStyle20notBold,
            ),
            Text(
              S.of(context).policy4,
              style: AppStyles.textStyle24blackBold,
            ),
            Text(
              S.of(context).policy4_desc,
              style: AppStyles.textStyle20notBold,
            ),
            Text(
              S.of(context).policy5,
              style: AppStyles.textStyle24blackBold,
            ),
            Text(
              S.of(context).policy5_desc,
              style: AppStyles.textStyle20notBold,
            ),
            Text(
              S.of(context).policy6,
              style: AppStyles.textStyle24blackBold,
            ),
            Text(
              S.of(context).policy6_desc,
              style: AppStyles.textStyle20notBold,
            )
          ],
        ),
      ),
    );
  }
}
