import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';

class AppStyles {
  static const TextStyle textStyle18black = TextStyle(
    fontSize: 18,
  );
  static const TextStyle textStyle18White = TextStyle(
    fontSize: 18,
    color: Colors.white,
  );
  static const TextStyle textStyle18 = TextStyle(
    fontSize: 18,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.primaryColor,
    color: AppColors.primaryColor,
  );
  static const TextStyle textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle textStyle24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    // the main color is black when you use this color anywhere use copyWith() method to change the color
    // color: Color(0xff00594E),
  );

  static const TextStyle textStyle16Regular = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Montserrat',
      color: Color(0xff80807F));

  static const TextStyle textStyle10Regular = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );
}
