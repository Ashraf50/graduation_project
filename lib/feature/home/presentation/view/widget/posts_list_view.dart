import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/post_item.dart';
import 'package:provider/provider.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvide = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: themeProvide.isDarkTheme
            ? AppColors.scaffoldColorDark
            : AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return const PostItem();
          },
        ),
      ),
    );
  }
}
