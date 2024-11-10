import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_style.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Discover\nyour new house!",
          style: AppStyles.textStyle20whiteBold,
        ),
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage("assets/img/test.jpg"),
        )
      ],
    );
  }
}
