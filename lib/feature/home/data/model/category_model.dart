class CategoryModel {
  final String categoryName;
  CategoryModel({required this.categoryName});
}

List allCategories = [
  CategoryModel(
    categoryName: "All",
  ),
  CategoryModel(
    categoryName: "Apartment",
  ),
  CategoryModel(
    categoryName: "Rooms",
  ),
];
