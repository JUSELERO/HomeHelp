// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.id,
        this.email,
        this.password,
    });

    String id;
    String email;
    String password;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "password": password,
    };
}
