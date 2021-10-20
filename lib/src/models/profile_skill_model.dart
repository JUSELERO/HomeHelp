// To parse this JSON data, do
//
//     final profileSkill = profileSkillFromJson(jsonString);

import 'dart:convert';

ProfileSkill profileSkillFromJson(String str) => ProfileSkill.fromJson(json.decode(str));

String profileSkillToJson(ProfileSkill data) => json.encode(data.toJson());

class ProfileSkill {
    ProfileSkill({
        this.id,
        this.score,
        this.profileId,
        this.skillId,
    });

    String id;
    int score;
    String profileId;
    String skillId;

    factory ProfileSkill.fromJson(Map<String, dynamic> json) => ProfileSkill(
        id: json["_id"],
        score: json["score"],
        profileId: json["profile_id"],
        skillId: json["skill_id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "score": score,
        "profile_id": profileId,
        "skill_id": skillId,
    };
}
