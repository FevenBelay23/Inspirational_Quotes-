import 'package:flutter_client/authentication/models/quote.dart';

class User {
  String email;
  String password;
  String role;
  String? confirmPassword;
  List<Quote> favorites;
  User(
      {required this.email,
      required this.password,
      required this.role,
      this.confirmPassword,
      this.favorites = const []});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['email'],
        password: json['password'],
        role: json['role'],
        favorites: json['favorites']);
  }
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "role": role,
      "confirmPassword": confirmPassword,
      "favorites": favorites,
    };
  }
}
