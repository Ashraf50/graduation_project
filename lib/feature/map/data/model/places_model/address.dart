class Address {
  String? label;
  String? countryCode;
  String? countryName;
  String? stateCode;
  String? state;
  String? county;
  String? city;
  String? district;
  String? street;
  String? postalCode;
  String? houseNumber;

  Address({
    this.label,
    this.countryCode,
    this.countryName,
    this.stateCode,
    this.state,
    this.county,
    this.city,
    this.district,
    this.street,
    this.postalCode,
    this.houseNumber,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        label: json['label'] as String?,
        countryCode: json['countryCode'] as String?,
        countryName: json['countryName'] as String?,
        stateCode: json['stateCode'] as String?,
        state: json['state'] as String?,
        county: json['county'] as String?,
        city: json['city'] as String?,
        district: json['district'] as String?,
        street: json['street'] as String?,
        postalCode: json['postalCode'] as String?,
        houseNumber: json['houseNumber'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'countryCode': countryCode,
        'countryName': countryName,
        'stateCode': stateCode,
        'state': state,
        'county': county,
        'city': city,
        'district': district,
        'street': street,
        'postalCode': postalCode,
        'houseNumber': houseNumber,
      };
}
