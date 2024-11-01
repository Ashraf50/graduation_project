import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constant/app_theme.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  const CustomTextfield({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        obscureText: obscureText ?? false,
        cursorColor:
            themeProvider.isDarkTheme ? AppColors.white : AppColors.black,
        style: TextStyle(
            color:
                themeProvider.isDarkTheme ? AppColors.white : AppColors.black,
            fontSize: 18),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: themeProvider.isDarkTheme
                    ? AppColors.widgetColorDark
                    : Color(0xffBCB8B1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: themeProvider.isDarkTheme
                    ? Color(0xffBCB8B1)
                    : AppColors.widgetColorDark),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
