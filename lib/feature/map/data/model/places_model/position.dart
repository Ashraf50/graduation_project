class Position {
  double? lat;
  double? lng;

  Position({this.lat, this.lng});

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        lat: (json['lat'] as num?)?.toDouble(),
        lng: (json['lng'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
      };
}
