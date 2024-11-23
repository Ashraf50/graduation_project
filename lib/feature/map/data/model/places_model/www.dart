import 'category.dart';

class Www {
  String? value;
  List<Category>? categories;

  Www({this.value, this.categories});

  factory Www.fromJson(Map<String, dynamic> json) => Www(
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
