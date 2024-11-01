import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/generated/l10n.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).contact),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
        child: ListView(
          children: [
            Text(
              S.of(context).any_question,
              style: AppStyles.textStyle20notBold,
            ),
            SelectableText(
              "Email: [arounUteam@gmail.com]",
              style: TextStyle(
                fontSize: 23,
                color: Colors.blue,
              ),
            ),
            Text(
              S.of(context).our_team,
              style: AppStyles.textStyle20notBold,
            ),
          ],
        ),
      ),
    );
  }
}
