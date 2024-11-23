import 'access.dart';
import 'address.dart';
import 'category.dart';
import 'contact.dart';
import 'food_type.dart';
import 'opening_hour.dart';
import 'position.dart';
import 'reference.dart';

class PlacesModel {
  String? title;
  String? id;
  String? ontologyId;
  String? resultType;
  Address? address;
  Position? position;
  List<Access>? access;
  int? distance;
  List<Category>? categories;
  List<Reference>? references;
  List<FoodType>? foodTypes;
  List<Contact>? contacts;
  List<OpeningHour>? openingHours;

  PlacesModel({
    this.title,
    this.id,
    this.ontologyId,
    this.resultType,
    this.address,
    this.position,
    this.access,
    this.distance,
    this.categories,
    this.references,
    this.foodTypes,
    this.contacts,
    this.openingHours,
  });

  factory PlacesModel.fromJson(Map<String, dynamic> json) => PlacesModel(
        title: json['title'] as String?,
        id: json['id'] as String?,
        ontologyId: json['ontologyId'] as String?,
        resultType: json['resultType'] as String?,
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, dynamic>),
        position: json['position'] == null
            ? null
            : Position.fromJson(json['position'] as Map<String, dynamic>),
        access: (json['access'] as List<dynamic>?)
            ?.map((e) => Access.fromJson(e as Map<String, dynamic>))
            .toList(),
        distance: json['distance'] as int?,
        categories: (json['categories'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
        references: (json['references'] as List<dynamic>?)
            ?.map((e) => Reference.fromJson(e as Map<String, dynamic>))
            .toList(),
        foodTypes: (json['foodTypes'] as List<dynamic>?)
            ?.map((e) => FoodType.fromJson(e as Map<String, dynamic>))
            .toList(),
        contacts: (json['contacts'] as List<dynamic>?)
            ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
            .toList(),
        openingHours: (json['openingHours'] as List<dynamic>?)
            ?.map((e) => OpeningHour.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'id': id,
        'ontologyId': ontologyId,
        'resultType': resultType,
        'address': address?.toJson(),
        'position': position?.toJson(),
        'access': access?.map((e) => e.toJson()).toList(),
        'distance': distance,
        'categories': categories?.map((e) => e.toJson()).toList(),
        'references': references?.map((e) => e.toJson()).toList(),
        'foodTypes': foodTypes?.map((e) => e.toJson()).toList(),
        'contacts': contacts?.map((e) => e.toJson()).toList(),
        'openingHours': openingHours?.map((e) => e.toJson()).toList(),
      };
}
