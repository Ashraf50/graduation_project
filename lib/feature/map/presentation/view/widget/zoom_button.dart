import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';

class ZoomButton extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final double posButton;
  const ZoomButton(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.posButton});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: posButton,
      right: 16,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteGrey,
          ),
          child: Icon(
            icon,
            size: 35,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}