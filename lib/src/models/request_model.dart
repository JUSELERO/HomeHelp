// To parse this JSON data, do
//
//     final request = requestFromJson(jsonString);

import 'dart:convert';

Request requestFromJson(String str) => Request.fromJson(json.decode(str));

String requestToJson(Request data) => json.encode(data.toJson());

class Request {
    Request({
        this.id,
        this.description,
        this.profileId,
        this.activityId,
    });

    String id;
    String description;
    String profileId;
    String activityId;

    factory Request.fromJson(Map<String, dynamic> json) => Request(
        id: json["_id"],
        description: json["description"],
        profileId: json["profile_id"],
        activityId: json["activity_id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "description": description,
        "profile_id": profileId,
        "activity_id": activityId,
    };
}
