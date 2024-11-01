import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/feature/account/presentation/view/account_view.dart';
import 'package:graduation_project/feature/category/presentation/view/category_view.dart';
import 'package:graduation_project/feature/favorite/presentation/view/favorite_view.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../feature/home/presentation/view/home_view.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  changeItem(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  List pages = [
    const HomeView(),
    const CategoryView(),
    const FavoriteView(),
    const AccountView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: changeItem,
        items: [
          SalomonBottomBarItem(
            icon: SvgPicture.asset("assets/img/home.svg", height: 25),
            activeIcon:
                SvgPicture.asset("assets/img/active_home.svg", height: 25),
            title: Text(S.of(context).home),
            selectedColor: AppColors.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: SvgPicture.asset("assets/img/category.svg", height: 25),
            activeIcon:
                SvgPicture.asset("assets/img/active_category.svg", height: 25),
            title: Text(S.of(context).category),
            selectedColor: AppColors.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: SvgPicture.asset("assets/img/favorite.svg", height: 25),
            activeIcon:
                SvgPicture.asset("assets/img/active_favorite.svg", height: 25),
            title: Text(S.of(context).favorite),
            selectedColor: AppColors.primaryColor,
          ),
          SalomonBottomBarItem(
            icon: SvgPicture.asset("assets/img/profile.svg", height: 25),
            activeIcon:
                SvgPicture.asset("assets/img/active_profile.svg", height: 25),
            title: Text(S.of(context).Account),
            selectedColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
