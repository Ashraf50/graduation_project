import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:provider/provider.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  const SearchTextField({
    super.key,
    this.suffixIcon,
    this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      height: 50,
      child: TextField(
        controller: controller,
        cursorColor: themeProvider.isDarkTheme
            ? AppColors.white
            : AppColors.primaryColor,
        style: TextStyle(
          color: themeProvider.isDarkTheme ? AppColors.white : AppColors.black,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: themeProvider.isDarkTheme
                  ? AppColors.widgetColorDark
                  : Color(0xffBCB8B1),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: themeProvider.isDarkTheme
                  ? AppColors.primaryColor
                  : AppColors.primaryColor,
            ),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
