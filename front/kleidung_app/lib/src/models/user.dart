// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.lastname,
    this.birthdate,
    this.phone,
    this.homeAddress,
    this.email,
    this.password,
    this.image,
    this.sessionToken,

  });

  String id;
  String name;
  String lastname;
  DateTime birthdate;
  String phone;
  String homeAddress;
  String email;
  String password;
  String image;
  String sessionToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    lastname: json["lastname"],
    birthdate: json["birthdate"],
    phone: json["phone"],
    homeAddress: json["home_address"],
    email: json["email"],
    password: json["password"],
    image: json["image"],
    sessionToken: json["session_token"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastname": lastname,
    "birthdate": birthdate,
    "phone": phone,
    "home_address": homeAddress,
    "email": email,
    "password": password,
    "image": image,
    "session_token": sessionToken,
  };
}