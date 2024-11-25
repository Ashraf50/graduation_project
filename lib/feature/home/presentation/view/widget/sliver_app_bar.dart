import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/home_search_layer.dart';
import 'package:graduation_project/generated/l10n.dart';
import '../../../../../core/widget/account_photo.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          HomeAppBar(),
          HomeSearchLayer(),
        ],
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).discover,
            style: AppStyles.textStyle20whiteBold,
          ),
          AccountPhoto(),
        ],
      ),
    );
  }
}
