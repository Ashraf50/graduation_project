import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/generated/l10n.dart';

showSnackbar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.widgetColorDark,
      duration: Duration(seconds: 5),
      content: Text(
        text,
        style: AppStyles.textStyle18White,
      ),
      action: SnackBarAction(
        label: S.of(context).dismiss,
        textColor: AppColors.white,
        onPressed: () {},
      ),
    ),
  );
}
