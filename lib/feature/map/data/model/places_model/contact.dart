import 'email.dart';
import 'phone.dart';
import 'www.dart';

class Contact {
  List<Phone>? phone;
  List<Www>? www;
  List<Email>? email;

  Contact({this.phone, this.www, this.email});

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        phone: (json['phone'] as List<dynamic>?)
            ?.map((e) => Phone.fromJson(e as Map<String, dynamic>))
            .toList(),
        www: (json['www'] as List<dynamic>?)
            ?.map((e) => Www.fromJson(e as Map<String, dynamic>))
            .toList(),
        email: (json['email'] as List<dynamic>?)
            ?.map((e) => Email.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'phone': phone?.map((e) => e.toJson()).toList(),
        'www': www?.map((e) => e.toJson()).toList(),
        'email': email?.map((e) => e.toJson()).toList(),
      };
}
