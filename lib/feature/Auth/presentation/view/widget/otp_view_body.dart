import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/feature/Auth/presentation/view/confirm_otp_view.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/forget_password_custom_text_feild.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/title_and_sub_widget.dart';

import 'custom_paint_widget.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomPaintWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const TitleAndSubWidget(
                    title: 'OTP verification',
                    subTitle:
                        'we will send you one-time password to your mobile number'),

                const SizedBox(height: 32),

                const ForgetPasswordCustomTextFeild(
                  hintText: 'Phone',
                ),
                const SizedBox(height: 72),
                // const Spacer(),
                CustomButton(
                    title: 'Send',
                    onTap: () {
                      Get.to(() => const ConfirmOtpView());
                    }),
                // const Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
