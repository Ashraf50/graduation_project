import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_style.dart';

class AccountHeaderContent extends StatelessWidget {
  const AccountHeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        context.push('/edit_profile');
      },
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: themeProvider.isDarkTheme
                ? AppColors.widgetColorDark
                : AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/img/test.jpg"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ashraf Essam",
                        style: AppStyles.textStyle20notBold,
                      ),
                      Text(
                        S.of(context).edit,
                        style: AppStyles.textStyle18gray,
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
