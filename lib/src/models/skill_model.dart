// To parse this JSON data, do
//
//     final skill = skillFromJson(jsonString);

import 'dart:convert';

Skill skillFromJson(String str) => Skill.fromJson(json.decode(str));

String skillToJson(Skill data) => json.encode(data.toJson());

class Skill {
    Skill({
        this.id,
        this.name,
        this.description,
        this.image,
    });

    String id;
    String name;
    String description;
    String image;

    factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "image": image,
    };
}
