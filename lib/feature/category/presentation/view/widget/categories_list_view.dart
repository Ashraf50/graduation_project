import 'package:flutter/material.dart';
import 'package:graduation_project/feature/category/presentation/view/widget/category_item.dart';
import '../../../../../generated/l10n.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> allCategories = [
      CategoryModel(
        title: S.of(context).apartment,
        image: "assets/img/apartment.png",
        onTap: () {},
      ),
      CategoryModel(
        title: S.of(context).room,
        image: "assets/img/room.png",
        onTap: () {},
      ),
    ];
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: allCategories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: CategoryItem(
            category: allCategories[index],
          ),
        );
      },
    );
  }
}

class CategoryModel {
  final String image;
  final String title;
  final void Function() onTap;
  const CategoryModel({
    required this.title,
    required this.image,
    required this.onTap,
  });
}
