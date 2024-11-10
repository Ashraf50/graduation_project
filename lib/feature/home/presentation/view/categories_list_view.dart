import 'package:flutter/material.dart';
import 'package:graduation_project/feature/home/data/model/category_model.dart';
import 'package:graduation_project/feature/home/presentation/view/widget/category_item.dart';
import 'package:graduation_project/generated/l10n.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  _CategoriesListViewState createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> allCategories = [
      CategoryModel(
        categoryName: S.of(context).all,
      ),
      CategoryModel(
        categoryName: S.of(context).apartment,
      ),
      CategoryModel(
        categoryName: S.of(context).room,
      ),
    ];
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: allCategories.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            categoryName: allCategories[index],
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
