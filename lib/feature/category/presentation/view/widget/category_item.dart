import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/feature/category/presentation/view/widget/categories_list_view.dart';
import 'package:graduation_project/generated/l10n.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  const CategoryItem({
    super.key,
    required this.category,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.title,
                  style: AppStyles.textStyle20,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButton(
                  title: S.of(context).view,
                  onTap: category.onTap,
                  width: 80,
                )
              ],
            ),
            Image.asset(category.image),
          ],
        ),
      ),
    );
  }
}
