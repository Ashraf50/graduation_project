import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/widget/search_textfield.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:provider/provider.dart';

class SearchLayer extends StatelessWidget {
  const SearchLayer({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return Row(
      children: [
        Expanded(
          child: SearchTextField(
            hintText: S.of(context).search_here,
            prefixIcon: Icon(
              Icons.search,
              size: 30,
              color: AppColors.primaryColor,
            ),
            focusedColor: AppColors.primaryColor,
            enabledColor: theme.isDarkTheme
                ? AppColors.widgetColorDark
                : Color(0xffBCB8B1),
            cursorColor: Colors.black,
            filled: true,
            fillColor: AppColors.white,
            radius: 12,
            style: TextStyle(
              color: AppColors.black,
            ),
            controller: TextEditingController(),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {},
          child: Container(
            width: 47,
            height: 47,
            decoration: BoxDecoration(
              color: AppColors.secondColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: SvgPicture.asset(
                "assets/img/sort.svg",
                height: 22,
                // fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
