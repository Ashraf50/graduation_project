import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/generated/l10n.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/img/splash1.png"),
        const SizedBox(
          height: 38,
        ),
        Text(
          S.of(context).Ready,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle24,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          S.of(context).text_splash3,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle18black,
        ),
      ],
    );
  }
}
