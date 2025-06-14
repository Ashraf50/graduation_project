import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final int maxLines;
  final TextInputType? keyboardType;
  final void Function(String?)? onSubmitted;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.maxLines = 1,
    this.keyboardType,
    this.onSubmitted,
    this.validator,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSubmitted,
      onChanged: onSubmitted,
      autovalidateMode: autovalidateMode,
      validator: validator,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        labelStyle: const TextStyle(color: AppColors.primaryColor),
        focusColor: AppColors.primaryColor,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        labelText: labelText,
        prefixIcon: Icon(
          prefixIcon,
          color: AppColors.primaryColor,
        ),
        border: OutlineInputBorder(),
      ),
      maxLines: maxLines,
      keyboardType: keyboardType,
    );
  }
}
