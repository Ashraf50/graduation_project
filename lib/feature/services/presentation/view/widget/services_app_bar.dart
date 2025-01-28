import 'package:flutter/material.dart';
import '../../../../../core/constant/app_style.dart';
import '../../../../../generated/l10n.dart';

class ServicesAppBar extends StatelessWidget {
  const ServicesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).services,
        style: AppStyles.textStyle24WhiteBold,
      ),
    );
  }
}
