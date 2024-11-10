import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';

class ForgetPasswordCustomTextFeild extends StatefulWidget {
  const ForgetPasswordCustomTextFeild({
    super.key,
    this.obscureText = false, this.hintText,
  });
  final bool obscureText;
  final String? hintText;
  @override
  State<ForgetPasswordCustomTextFeild> createState() =>
      _ForgetPasswordCustomTextFeildState();
}

class _ForgetPasswordCustomTextFeildState
    extends State<ForgetPasswordCustomTextFeild> {
  bool? isTrue;
  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          obscureText: true,
          decoration: InputDecoration(
              hintStyle: AppStyles.textStyle16Regular.copyWith(
                color: const Color(0xffB6B5B5),
              ),
              hintText: widget.hintText ??  "Email or Phone",
              border: createBorder(),
              disabledBorder: createBorder(),
              enabledBorder: createBorder(),
              focusedBorder: createBorder(),
              suffixIcon: widget.obscureText
                  ? const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Color(0xffB6B5B5),
                    )
                  : isTrue == null
                      ? null
                      : (isTrue == true
                          ? const Icon(
                              Icons.check,
                              color: AppColors.primaryColor,
                            )
                          : const Icon(
                              Icons.close,
                              color: Colors.red,
                            ))),
          cursorColor: const Color(0xffB6B5B5),
          onChanged: (value) {
            final gmailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');

            // Check if the value matches the email format
            if (gmailRegex.hasMatch(value)) {
              setState(() {
                isTrue = true;
              });
            } else {
              setState(() {
                isTrue = false;
              });
            }
          },
        ),
        isTrue == false
            ? Text(
                "Not a volid email address, Should be your@email.com",
                style: AppStyles.textStyle10Regular.copyWith(color: Colors.red),
              )
            : const SizedBox(),
      ],
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
