import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return AppBar(
      centerTitle: true,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: true,
      
      backgroundColor: themeProvider.isDarkTheme
          ? AppColors.scaffoldColorDark
          : Colors.white,
      title: Text(title, style: AppStyles.textStyle18gray),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
