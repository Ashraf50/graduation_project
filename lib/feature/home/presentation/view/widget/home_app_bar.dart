import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/generated/l10n.dart';

import '../../../../../core/widget/account_photo.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).discover,
          style: AppStyles.textStyle20whiteBold,
        ),
        AccountPhoto(),
      ],
    );
  }
}
