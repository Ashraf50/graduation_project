import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/generated/l10n.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/img/splash1.png'),
        const SizedBox(
          height: 38,
        ),
        Text(
          S.of(context).Welcome,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle24,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          S.of(context).text_splash1,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle18black,
        )
      ],
    );
  }
}
