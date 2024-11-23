class Access {
  double? lat;
  double? lng;

  Access({this.lat, this.lng});

  factory Access.fromJson(Map<String, dynamic> json) => Access(
        lat: (json['lat'] as num?)?.toDouble(),
        lng: (json['lng'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
      };
}
