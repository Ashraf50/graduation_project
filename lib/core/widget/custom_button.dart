import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color buttonColor;
  final Color textColor;
  final double width;
  double height;
  double? textSize;

  CustomButton({
    super.key,
    this.height = 60,
    required this.title,
    required this.onTap,
    this.buttonColor = AppColors.primaryColor,
    this.textColor = Colors.white,
    required this.width,
    double? textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: buttonColor,
            border: Border.all(
              color: AppColors.primaryColor,
            ),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: textSize ?? 20,
                  color: textColor,
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
