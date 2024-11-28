import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:provider/provider.dart';

class ChangePhotoButton extends StatelessWidget {
  final void Function()? choosePhoto;
  final void Function()? takePhoto;
  const ChangePhotoButton({
    super.key,
    required this.choosePhoto,
    required this.takePhoto,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        showModalBottomSheet(
          backgroundColor: themeProvider.isDarkTheme
              ? AppColors.widgetColorDark
              : AppColors.white,
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 155,
                child: Column(
                  children: [
                    TextButton(
                      title: S.of(context).choose_photo,
                      onTap: choosePhoto,
                    ),
                    CustomDivider(),
                    TextButton(
                      title: S.of(context).take_photo,
                      onTap: takePhoto,
                    ),
                    CustomDivider(),
                    TextButton(
                      title: S.of(context).cancel,
                      onTap: () {
                        context.pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: CircleAvatar(
        backgroundColor: AppColors.primaryColor,
        child: SvgPicture.asset(
          'assets/img/Camera.svg',
          height: 18,
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        color: themeProvider.isDarkTheme
            ? AppColors.grey
            : AppColors.widgetColorDark,
      ),
    );
  }
}

class TextButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  const TextButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: Center(
          child: Text(
            title,
            style: AppStyles.textStyle18black,
          ),
        ),
      ),
    );
  }
}
