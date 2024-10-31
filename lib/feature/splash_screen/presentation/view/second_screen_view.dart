import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_style.dart';

import '../../../../generated/l10n.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/img/splash1.png"),
        const SizedBox(
          height: 38,
        ),
        Text(
          S.of(context).Easily_explore,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle24,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          S.of(context).text_splash2,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle18black,
        ),
      ],
    );
  }
}
