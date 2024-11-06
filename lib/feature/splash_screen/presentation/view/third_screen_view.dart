import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/feature/splash_screen/presentation/view/widget/custom_clipper.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:provider/provider.dart';
import '../../../../core/constant/app_theme.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 2,
          child: ClipPath(
            clipper: BottomCircularClipper(),
            child: Image.asset(
              "assets/img/splash3.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.1,
        ),
        Text(
          S.of(context).Ready,
          textAlign: TextAlign.center,
          style: themeProvider.isDarkTheme
              ? AppStyles.textStyle24greenDark
              : AppStyles.textStyle24greenLight,
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
