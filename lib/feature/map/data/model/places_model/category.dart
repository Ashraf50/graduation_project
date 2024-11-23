class Category {
  String? id;
  String? name;
  bool? primary;

  Category({this.id, this.name, this.primary});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
