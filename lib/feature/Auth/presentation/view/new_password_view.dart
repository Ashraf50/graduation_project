import 'package:flutter/material.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/new_password_view_body.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      backgroundColor:  Color(0xfffcfcfc),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NewPasswordViewBody(),
      ),
    );
  }
}
