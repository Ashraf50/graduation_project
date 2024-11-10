import 'package:flutter/material.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/confirm_otp_view_body.dart';

class ConfirmOtpView extends StatelessWidget {
  const ConfirmOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      backgroundColor: Color(0xfffcfcfc),
      body: ConfirmOtpViewBody(),
    );
  }
}
