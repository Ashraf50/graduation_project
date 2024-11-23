class Supplier {
  String? id;

  Supplier({this.id});

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}
