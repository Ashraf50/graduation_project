class ServicesModel {
	int? sid;
	int? id;
	String? name;
	String? type;
	String? locationType;
	double? latitude;
	double? longitude;
	String? phone;
	String? workingHours;
	dynamic distanceKm;
	dynamic distanceMeters;

	ServicesModel({
		this.sid, 
		this.id, 
		this.name, 
		this.type, 
		this.locationType, 
		this.latitude, 
		this.longitude, 
		this.phone, 
		this.workingHours, 
		this.distanceKm, 
		this.distanceMeters, 
	});

	factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
				sid: json['Sid'] as int?,
				id: json['id'] as int?,
				name: json['name'] as String?,
				type: json['type'] as String?,
				locationType: json['location_type'] as String?,
				latitude: (json['latitude'] as num?)?.toDouble(),
				longitude: (json['longitude'] as num?)?.toDouble(),
				phone: json['phone'] as String?,
				workingHours: json['workingHours'] as String?,
				distanceKm: json['distanceKm'] as dynamic,
				distanceMeters: json['distanceMeters'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'Sid': sid,
				'id': id,
				'name': name,
				'type': type,
				'location_type': locationType,
				'latitude': latitude,
				'longitude': longitude,
				'phone': phone,
				'workingHours': workingHours,
				'distanceKm': distanceKm,
				'distanceMeters': distanceMeters,
			};
}
