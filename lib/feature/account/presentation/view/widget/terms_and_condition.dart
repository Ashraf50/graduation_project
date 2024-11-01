import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/generated/l10n.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).terms),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
        child: ListView(
          children: [
            Text(
              S.of(context).terms_welcome,
              style: AppStyles.textStyle20notBold,
            ),
            Text(
              S.of(context).terms1,
              style: AppStyles.textStyle24blackBold,
            ),
            Text(
              S.of(context).terms1_desc,
              style: AppStyles.textStyle20notBold,
            ),
            Text(
              S.of(context).terms2,
              style: AppStyles.textStyle24blackBold,
            ),
            Text(
              S.of(context).terms2_desc,
              style: AppStyles.textStyle20notBold,
            ),
            Text(
              S.of(context).terms3,
              style: AppStyles.textStyle24blackBold,
            ),
            Text(
              S.of(context).terms3_desc,
              style: AppStyles.textStyle20notBold,
            ),
            Text(
              S.of(context).terms4,
              style: AppStyles.textStyle24blackBold,
            ),
            Text(
              S.of(context).terms4_desc,
              style: AppStyles.textStyle20notBold,
            ),
            Text(
              S.of(context).terms5,
              style: AppStyles.textStyle24blackBold,
            ),
            Text(
              S.of(context).terms5_desc,
              style: AppStyles.textStyle20notBold,
            ),
            Text(
              S.of(context).terms6,
              style: AppStyles.textStyle24blackBold,
            ),
            Text(
              S.of(context).terms6_desc,
              style: AppStyles.textStyle20notBold,
            ),
            Text(
              S.of(context).terms7,
              style: AppStyles.textStyle24blackBold,
            ),
            Text(
              S.of(context).terms7_desc,
              style: AppStyles.textStyle20notBold,
            ),
            Text(
              S.of(context).terms8,
              style: AppStyles.textStyle24blackBold,
            ),
            Text(
              S.of(context).terms8_desc,
              style: AppStyles.textStyle20notBold,
            ),
          ],
        ),
      ),
    );
  }
}
