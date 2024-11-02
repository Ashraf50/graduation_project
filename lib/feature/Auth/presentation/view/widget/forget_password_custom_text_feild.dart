import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_style.dart';

class ForgetPasswordCustomTextFeild extends StatelessWidget {
  const ForgetPasswordCustomTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintStyle: AppStyles.textStyle16Regular,
        hintText: "Email or phone",
        border: createBorder(),
        disabledBorder: createBorder(),
        enabledBorder: createBorder(),
        focusedBorder: createBorder(),
      ),
    );
  }

  OutlineInputBorder createBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(
        width: .6,
        color: Color(0xffB6B5B5),
      ),
    );
  }
}
