class UserModel {
  String id;
  String username;
  String email;
  dynamic phone;
  dynamic address;
  String password;
  String role;
  DateTime createdAt;
  String? profileImage;
  String token;
  bool status;
  String message;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.phone,
    this.address,
    required this.password,
    required this.role,
    required this.createdAt,
    this.profileImage,
    required this.token,
    required this.status,
    required this.message,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final userData = json['user'] as Map<String, dynamic>?;

    return UserModel(
      id: userData?['id'],
      username: userData?['username'],
      email: userData?['email'],
      phone: userData?['phone'],
      address: userData?['address'],
      password: userData?['password'],
      role: userData?['role'],
      createdAt: DateTime.parse(userData!['createdAt']),
      profileImage: userData['profileImage'] as String?,
      token: userData['token'],
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() => {
        'user': {
          'id': id,
          'username': username,
          'email': email,
          'phone': phone,
          'address': address,
          'password': password,
          'role': role,
          'createdAt': createdAt.toIso8601String(),
          'profileImage': profileImage,
          'token': token,
        },
        'status': status,
        'message': message,
      };
}
