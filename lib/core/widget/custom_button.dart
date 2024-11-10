import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
<<<<<<< HEAD
  final Color buttonColor;
  final Color textColor;
  final double width;
=======
  final Color? buttonColor;
  final Color? textColor;
>>>>>>> 229e9cff15ba66d70ddeedf8b933c9496eee95a4
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
<<<<<<< HEAD
    required this.buttonColor,
    required this.textColor,
    required this.width,
=======
    this.buttonColor = AppColors.primaryColor,
    this.textColor = Colors.white,
>>>>>>> 229e9cff15ba66d70ddeedf8b933c9496eee95a4
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
