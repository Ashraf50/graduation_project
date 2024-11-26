import 'package:flutter/material.dart';
import 'package:graduation_project/core/widget/decoration_page.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/constant/app_theme.dart';
import '../../forget_pass/desktop_forget_pass_view_body.dart';

class DesktopForgetPassView extends StatelessWidget {
  const DesktopForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return DesktopDecorationPage(
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: theme.isDarkTheme
                ? Image.asset("assets/img/logo.png")
                : Image.asset("assets/img/logo_black.png"),
          ),
          Expanded(
            flex: 2,
            child: DesktopForgetPasswordViewBody(),
          ),
        ],
      ),
    );
  }
}
