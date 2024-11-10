import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/feature/home/presentation/view/categories_list_view.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/posts_list_view.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/home_app_bar.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/search_layer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .28,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  HomeAppBar(),
                  SizedBox(height: 15),
                  SearchLayer(),
                  SizedBox(height: 15),
                  CategoriesListView(),
                ],
              ),
            ),
          ),
          PostsListView(),
        ],
      ),
    );
  }
}
