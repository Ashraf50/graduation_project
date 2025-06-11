class Flat {
  final int flatId;
  final String createdAt;
  final String numRooms;
  final String numBathroom;
  final String description;
  final String landlordId;
  final String space;

  Flat({
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
