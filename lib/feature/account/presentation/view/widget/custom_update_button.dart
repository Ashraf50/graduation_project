import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:provider/provider.dart';

class CustomUpdateButton extends StatelessWidget {
  final String title;
  final String subTitle;
  final Icon icon;
  final void Function() onPressed;
  final String imageIcon;

  const CustomUpdateButton({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.imageIcon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  imageIcon,
                  height: 30,
                  colorFilter: ColorFilter.mode(
                    themeProvider.isDarkTheme
                        ? AppColors.white
                        : AppColors.black,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppStyles.textStyle18black,
                    ),
                    Text(
                      subTitle,
                      style: AppStyles.textStyle16gray,
                    )
                  ],
                )
              ],
            ),
            IconButton(
              onPressed: onPressed,
              icon: icon,
            ),
          ],
        ),
        Divider(
          color: themeProvider.isDarkTheme
              ? AppColors.widgetColorDark
              : AppColors.whiteGrey,
          thickness: 3,
        )
      ],
    );
  }
}

class CustomLogoutDeleteButton extends StatelessWidget {
  final String title;
  final String image;
  final void Function() onTap;
  const CustomLogoutDeleteButton({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: onTap,
          child: Row(
            children: [
              SvgPicture.asset(
                image,
                height: 30,
                colorFilter: ColorFilter.mode(
                  themeProvider.isDarkTheme ? AppColors.white : AppColors.black,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                title,
                style: AppStyles.textStyle18black,
              )
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Divider(
          color: themeProvider.isDarkTheme
              ? AppColors.widgetColorDark
              : AppColors.whiteGrey,
          thickness: 3,
        )
      ],
    );
  }
}
