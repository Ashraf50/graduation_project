import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:provider/provider.dart';

class DarkModeButton extends StatefulWidget {
  const DarkModeButton({super.key});

  @override
  State<DarkModeButton> createState() => _DarkModeButtonState();
}

class _DarkModeButtonState extends State<DarkModeButton> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: themeProvider.isDarkTheme
              ? AppColors.widgetColorDark
              : AppColors.whiteGrey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/img/dark_mode.svg",
                  height: 25,
                  colorFilter: ColorFilter.mode(
                    themeProvider.isDarkTheme
                        ? AppColors.white
                        : AppColors.black,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                Text("Dark Mode", style: AppStyles.textStyle18black),
              ],
            ),
            Switch(
              value: themeProvider.isDarkTheme,
              onChanged: (val) {
                themeProvider.setThemeData = val;
              },
              activeColor: AppColors.primaryColor,
              trackOutlineColor: MaterialStateProperty.all(
                themeProvider.isDarkTheme
                    ? AppColors.widgetColorDark
                    : AppColors.whiteGrey,
              ),
              inactiveThumbColor: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
