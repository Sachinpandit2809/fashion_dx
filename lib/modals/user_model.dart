import 'dart:convert';

class UserModel {
  String id;
  // String message;
  String email;
  UserModel({
    required this.email,
    required this.id,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'id': id,
    };
  }

  String get encodedJson  => jsonEncode(toJson());
}
