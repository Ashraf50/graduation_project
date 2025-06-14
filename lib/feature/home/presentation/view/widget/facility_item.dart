import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:provider/provider.dart';

class FacilityItem extends StatelessWidget {
  final String image;
  final String title;
  const FacilityItem({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvide = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: themeProvide.isDarkTheme ? AppColors.white : AppColors.black,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            image,
            height: 30,
            colorFilter: ColorFilter.mode(
              themeProvide.isDarkTheme ? AppColors.white : AppColors.black,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: AppStyles.textStyle18black
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
