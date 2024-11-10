import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_otp_text_feild.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/forget_password_state_image.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/title_and_sub_widget.dart';

class ConfirmOtpViewBody extends StatelessWidget {
  const ConfirmOtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const CustomImageWidget(image: 'assets/img/Otp.svg'),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TitleAndSubWidget(
              inCenter: true,
              title: 'OTP verification',
              subTitle:
                  'we will send you one-time password to your mobile number',
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const CustomOtpTextFeild(),
          const SizedBox(
            height: 35,
          ),
          const Text(
            '00:30',
            style: AppStyles.textStyle10Regular,
          ),
          const SizedBox(
            height: 17,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Did not send OTP? ",
                style: AppStyles.textStyle10Regular,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Resnd OTP',
                style: AppStyles.textStyle10Regular.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 45,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomButton(title: 'Sumbit', onTap: () {}),
          )
        ],
      ),
    );
  }
}
