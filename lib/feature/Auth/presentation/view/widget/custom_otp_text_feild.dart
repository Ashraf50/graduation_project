import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_otp_box_widget.dart';

class CustomOtpTextFeild extends StatelessWidget {
  const CustomOtpTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          itemCount: 4,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => const CustomOtpBoxWidget()),
    );
  }
}
