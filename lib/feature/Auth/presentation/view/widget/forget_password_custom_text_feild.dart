import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';

import '../../../../../generated/l10n.dart';

class ForgetPasswordCustomTextFeild extends StatelessWidget {
  const ForgetPasswordCustomTextFeild({super.key, this.isTrue});
  final bool? isTrue;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintStyle: AppStyles.textStyle16Regular.copyWith(
          color: const Color(0xffB6B5B5),
        ),
        hintText: "Email or Phone",
        border: createBorder(),
        disabledBorder: createBorder(),
        enabledBorder: createBorder(),
        focusedBorder: createBorder(),
        suffixIcon: isTrue == null
            ? null
            : (isTrue == true
                ? const Icon(
                    Icons.check,
                    color: AppColors.primaryColor,
                  )
                : const Icon(
                    Icons.close,
                    color: Colors.red,
                  )),
      ),
      cursorColor: const Color(0xffB6B5B5),
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
