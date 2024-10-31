import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:provider/provider.dart';

class DarkModeWidget extends StatefulWidget {
  const DarkModeWidget({super.key});

  @override
  State<DarkModeWidget> createState() => _DarkModeWidgetState();
}

class _DarkModeWidgetState extends State<DarkModeWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(
                Icons.dark_mode_outlined,
                size: 27,
                color: Colors.white,
              ),
              SizedBox(
                width: 18,
              ),
              Text(
                "Dark Mode",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Switch(
            value: themeProvider.isDarkTheme,
            onChanged: (val) {
              themeProvider.setThemeData = val;
            },
            activeColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}
