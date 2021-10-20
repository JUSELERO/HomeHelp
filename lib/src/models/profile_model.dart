// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
    Profile({
        this.id,
        this.firstname,
        this.lastname,
        this.bio,
        this.documentNumber,
        this.image,
        this.phone,
        this.address,
        this.city,
        this.birthdate,
        this.userId,
    });

    String id;
    String firstname;
    String lastname;
    String bio;
    String documentNumber;
    String image;
    String phone;
    String address;
    String city;
    String birthdate;
    String userId;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        bio: json["bio"],
        documentNumber: json["document_number"],
        image: json["image"],
        phone: json["phone"],
        address: json["address"],
        city: json["city"],
        birthdate: json["birthdate"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "bio": bio,
        "document_number": documentNumber,
        "image": image,
        "phone": phone,
        "address": address,
        "city": city,
        "birthdate": birthdate,
        "user_id": userId,
    };
}
