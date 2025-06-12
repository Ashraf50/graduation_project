import 'package:image_picker/image_picker.dart';

class Flat {
  final int flatId;
  final String createdAt;
  String? numRooms;
  String? numBathroom;
  String? description;
  String? landlordId;
  String? space;
  String? price;
  List<XFile>? images;

  Flat({
    this.price,
    this.images,
    required this.flatId,
    required this.createdAt,
    required this.numRooms,
    required this.numBathroom,
    required this.description,
    required this.landlordId,
    required this.space,
  });

  factory Flat.fromJson(Map<String, dynamic> json) {
    return Flat(
      flatId: json['flat_id'],
      createdAt: json['created_at'],
      numRooms: json['num_rooms'],
      numBathroom: json['num_bathroom'],
      description: json['description'],
      landlordId: json['landlord_id'],
      space: json['space'],
    );
  }
}
