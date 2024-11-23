import 'supplier.dart';

class Reference {
  Supplier? supplier;
  String? id;

  Reference({this.supplier, this.id});

  factory Reference.fromJson(Map<String, dynamic> json) => Reference(
        supplier: json['supplier'] == null
            ? null
            : Supplier.fromJson(json['supplier'] as Map<String, dynamic>),
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'supplier': supplier?.toJson(),
        'id': id,
      };
}
