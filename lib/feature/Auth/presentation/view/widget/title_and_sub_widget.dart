
import 'package:flutter/material.dart';

import '../../../../../core/constant/app_style.dart';
import '../../../../../generated/l10n.dart';
 
class TitleAndSubWidget extends StatelessWidget {
  const TitleAndSubWidget(
      {super.key, required this.title, required this.subTitle});
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
         title,
          style: AppStyles.textStyle24,
        ),
        const SizedBox(
          height: 16,
        ),
          Text(
          subTitle,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle16Regular,
        ),
      ],
    );
  }
}
