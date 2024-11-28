import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:provider/provider.dart';

class DesktopDecorationPage extends StatelessWidget {
  final Widget widget;
  const DesktopDecorationPage({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.sizeOf(context).width * 0.6,
        height: MediaQuery.sizeOf(context).height * 0.8,
        decoration: BoxDecoration(
          color:
              theme.isDarkTheme ? AppColors.widgetColorDark : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
        ),
        child: widget,
      ),
    );
  }
}
