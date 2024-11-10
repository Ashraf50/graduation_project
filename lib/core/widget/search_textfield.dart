import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:provider/provider.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double radius;
  final TextEditingController? controller;
  final bool? filled;
  final Color? fillColor;
  const SearchTextField({
    super.key,
    this.suffixIcon,
    this.controller,
    required this.hintText,
    this.filled,
    this.fillColor,
    this.prefixIcon,
    required this.radius,
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
          filled: filled,
          fillColor: fillColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: themeProvider.isDarkTheme
                  ? AppColors.widgetColorDark
                  : Color(0xffBCB8B1),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: themeProvider.isDarkTheme
                  ? AppColors.primaryColor
                  : AppColors.primaryColor,
            ),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
