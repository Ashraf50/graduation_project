import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:provider/provider.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Theme(
        data: Theme.of(context).copyWith(
          popupMenuTheme: PopupMenuThemeData(
            color: themeProvider.isDarkTheme
                ? AppColors.widgetColorDark
                : AppColors.whiteGrey,
          ),
        ),
        child: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'save') {
              print('Saved');
            }
          },
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: S.of(context).save,
                height: 25,
                textStyle: AppStyles.textStyle18black,
                child: Text(S.of(context).save),
              ),
            ];
          },
          child: Icon(Icons.more_horiz),
        ),
      ),
    );
  }
}
