class UserModel {
  bool? status;
  dynamic message;
  int id;
  String name;
  String email;
  String phone;
  String image;
  int? points;
  int? credit;
  String token;
  UserModel({
    this.status,
    this.message,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    this.points,
    this.credit,
    required this.token,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    var data = json['data'];
    return UserModel(
      status: json['status'] as bool?,
      message: json['message'],
      id: data['id'] as int,
      name: data['name'] as String,
      email: data['email'] as String,
      phone: data['phone'] as String,
      image: data['image'] as String,
      points: data['points'] as int?,
      credit: data['credit'] as int?,
      token: data['token'] as String,
    );
  }
  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': {
          'id': id,
          'name': name,
          'email': email,
          'phone': phone,
          'image': image,
          'points': points,
          'credit': credit,
          'token': token,
        },
      };
}
