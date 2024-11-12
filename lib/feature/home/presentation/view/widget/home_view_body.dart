import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/home/presentation/view/categories_list_view.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/posts_list_view.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/home_app_bar.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/search_layer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
      floatingActionButton: InkWell(
        onTap: () {
          context.push("/map");
        },
        child: CircleAvatar(
          backgroundColor: const Color.fromARGB(175, 0, 89, 79),
          radius: 30,
          child: SvgPicture.asset(
            "assets/img/location.svg",
            height: 30,
          ),
        ),
      ),
    );
  }
}
