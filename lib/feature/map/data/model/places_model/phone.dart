import 'category.dart';

class Phone {
  String? value;
  List<Category>? categories;

  Phone({this.value, this.categories});

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        value: json['value'] as String?,
        categories: (json['categories'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'categories': categories?.map((e) => e.toJson()).toList(),
      };
}
