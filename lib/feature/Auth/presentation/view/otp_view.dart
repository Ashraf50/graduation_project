import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/otp_view_body.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      backgroundColor: Color(0xfffcfcfc),
      body: OtpViewBody(),
    );
  }
}
