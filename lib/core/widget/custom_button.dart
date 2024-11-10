import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color? buttonColor;
  final Color? textColor;
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.buttonColor = AppColors.primaryColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: buttonColor,
            border: Border.all(
              color: AppColors.primaryColor,
            ),
          ),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: textColor,
            ),
          )),
        ),
      ),
    );
  }
}
