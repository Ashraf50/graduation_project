import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/generated/l10n.dart';

import '../../../../../core/constant/app_style.dart';

class OrDivide extends StatelessWidget {
  const OrDivide({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          color: AppColors.primaryColor,
        )),
        Text(
          S.of(context).or,
          style: AppStyles.textStyle18black,
        ),
        const Expanded(
            child: Divider(
          color: AppColors.primaryColor,
        )),
      ],
    );
  }
}
