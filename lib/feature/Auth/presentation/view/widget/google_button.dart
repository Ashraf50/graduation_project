import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/constant/app_colors.dart';

class GoogleButton extends StatelessWidget {
  final String image;
  final void Function() onTap;
  const GoogleButton({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Material(
        elevation: 6,
        shape: const CircleBorder(),
        child: InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 30,
            child: SvgPicture.asset(
              image,
              width: 40,
            ),
          ),
        ),
      ),
    );
  }
}
