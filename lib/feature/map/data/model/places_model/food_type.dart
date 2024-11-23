class FoodType {
  String? id;
  String? name;
  bool? primary;

  FoodType({this.id, this.name, this.primary});

  factory FoodType.fromJson(Map<String, dynamic> json) => FoodType(
        id: json['id'] as String?,
        name: json['name'] as String?,
        primary: json['primary'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'primary': primary,
      };
}
