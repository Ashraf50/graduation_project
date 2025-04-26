import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:provider/provider.dart';

class ApartmentProperties extends StatelessWidget {
  final String image;
  final String title;
  const ApartmentProperties({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvide = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Row(
        children: [
          SvgPicture.asset(
            image,
            height: 20,
            colorFilter: ColorFilter.mode(
              themeProvide.isDarkTheme ? AppColors.white : AppColors.black,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 4),
          Text(
            title,
            style: AppStyles.textStyle18black,
          ),
        ],
      ),
    );
  }
}
