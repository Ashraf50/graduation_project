import 'category.dart';
import 'structured.dart';

class OpeningHour {
  List<Category>? categories;
  List<dynamic>? text;
  bool? isOpen;
  List<Structured>? structured;

  OpeningHour({this.categories, this.text, this.isOpen, this.structured});

  factory OpeningHour.fromJson(Map<String, dynamic> json) => OpeningHour(
        categories: (json['categories'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
        text: json['text'] as List<dynamic>?,
        isOpen: json['isOpen'] as bool?,
        structured: (json['structured'] as List<dynamic>?)
            ?.map((e) => Structured.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'categories': categories?.map((e) => e.toJson()).toList(),
        'text': text,
        'isOpen': isOpen,
        'structured': structured?.map((e) => e.toJson()).toList(),
      };
}
