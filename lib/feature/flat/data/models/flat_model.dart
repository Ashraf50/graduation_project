import 'package:image_picker/image_picker.dart';

class Flat {
  int? flatId;
  String? createdAt;
  String? numRooms;
  String? numBathroom;
  String? description;
  String? landlordId;
  String? space;
  String? price;
  List<XFile>? images;
  Flat instance = Flat();
  Flat({
    this.flatId,
    this.createdAt,
    this.numRooms,
    this.numBathroom,
    this.description,
    this.landlordId,
    this.space,
    this.price,
    this.images,
  });

  factory Flat.fromJson(Map<String, dynamic> json) {
    return Flat(
      flatId: json['flat_id'] as int?,
      createdAt: json['created_at'] as String?,
      numRooms: json['num_rooms'] as String?,
      numBathroom: json['num_bathroom'] as String?,
      description: json['description'] as String?,
      landlordId: json['landlord_id'] as String?,
      space: json['space'] as String?,
      price: json['price'] as String?,
      images: json['images'],
    );
  }
}
