import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/widget/search_textfield.dart';
import 'package:graduation_project/generated/l10n.dart';

class SearchLayer extends StatelessWidget {
  const SearchLayer({super.key});

  @override
  Widget build(BuildContext context) {
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
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.secondColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: SvgPicture.asset(
              "assets/img/sort.svg",
              height: 25,
              // fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
