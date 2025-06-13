import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/feature/account/presentation/view/account_view.dart';
import 'package:graduation_project/feature/services/presentation/view/services_view.dart';
import 'package:graduation_project/feature/chat/presentation/view/chat_view.dart';
import 'package:graduation_project/feature/favorite/presentation/view/favorite_view.dart';
import 'package:graduation_project/feature/home/presentation/view/home_view.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'build_bottom_bar_widget.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const ServicesView(),
    const FavoriteView(),
    const ChatView(),
    const AccountView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDarkTheme = themeProvider.isDarkTheme;
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          buildBottomBarItem(
            iconPath: 'assets/img/home.svg',
            activeIconPath: 'assets/img/active_home.svg',
            title: S.of(context).home,
            isDarkTheme: isDarkTheme,
          ),
          buildBottomBarItem(
            iconPath: 'assets/img/category.svg',
            activeIconPath: 'assets/img/active_category.svg',
            title: S.of(context).services,
            isDarkTheme: isDarkTheme,
          ),
          buildBottomBarItem(
            iconPath: 'assets/img/favorite.svg',
            activeIconPath: 'assets/img/active_favorite.svg',
            title: S.of(context).favorite,
            isDarkTheme: isDarkTheme,
          ),
          buildBottomBarItem(
            iconPath: 'assets/img/chat.svg',
            activeIconPath: 'assets/img/active_chat.svg',
            title: S.of(context).chat,
            isDarkTheme: isDarkTheme,
          ),
          buildBottomBarItem(
            iconPath: 'assets/img/profile.svg',
            activeIconPath: 'assets/img/active_profile.svg',
            title: S.of(context).Account,
            isDarkTheme: isDarkTheme,
          ),
        ],
      ),
    );
  }


}
