import 'package:flutter/material.dart';
import 'package:graduation_project/feature/forget_password/presentaion/views/widgets/forget_password_view_body.dart';

import '../../../../core/widget/custom_scaffold.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: ForgetPasswordViewBody(),
    );
  }
}
