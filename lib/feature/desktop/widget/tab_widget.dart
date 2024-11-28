import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TabWidget extends StatelessWidget {
  final int selectedIndex;
  final int index;
  final String activeIcon;
  final String icon;
  const TabWidget({
    super.key,
    required this.selectedIndex,
    required this.activeIcon,
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: SvgPicture.asset(
        selectedIndex == index ? activeIcon : icon,
        colorFilter: ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
        height: 25,
      ),
    );
  }
}
