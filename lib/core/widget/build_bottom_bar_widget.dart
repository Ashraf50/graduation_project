  import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../constant/app_colors.dart';

SalomonBottomBarItem buildBottomBarItem({
    required String iconPath,
    required String activeIconPath,
    required String title,
    required bool isDarkTheme,
  }) {
    final Color iconColor = isDarkTheme ? AppColors.white : AppColors.black;
    final Color selectedColor =
        isDarkTheme ? AppColors.white : AppColors.primaryColor;

    return SalomonBottomBarItem(
      icon: SvgPicture.asset(
        iconPath,
        height: 25,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
      activeIcon: SvgPicture.asset(
        activeIconPath,
        height: 25,
        colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn),
      ),
      title: Text(title),
      selectedColor: selectedColor,
    );
  }
