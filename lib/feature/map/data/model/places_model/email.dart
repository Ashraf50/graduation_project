import 'category.dart';

class Email {
  String? value;
  List<Category>? categories;

  Email({this.value, this.categories});

  factory Email.fromJson(Map<String, dynamic> json) => Email(
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
