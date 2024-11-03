import 'package:flutter/material.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/forget_password_view_body.dart';

import '../../../../core/widget/custom_scaffold.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      backgroundColor:  Color(0xfffcfcfc),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ForgetPasswordViewBody(),
      ),
    );
  }
}
