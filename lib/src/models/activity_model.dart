// To parse this JSON data, do
//
//     final activityModel = activityModelFromJson(jsonString);

import 'dart:convert';

ActivityModel activityModelFromJson(String str) => ActivityModel.fromJson(json.decode(str));

String activityModelToJson(ActivityModel data) => json.encode(data.toJson());

class ActivityModel {
    ActivityModel({
        this.title,
        this.description,
        this.state,
        this.pricePerHour,
        this.estimatedHours,
        this.date,
        this.skill,
        this.postedBy,
    });

    String title;
    String description;
    int state;
    int pricePerHour;
    int estimatedHours;
    String date;
    String skill;
    String postedBy;

    factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        title: json["title"],
        description: json["description"],
        state: json["state"],
        pricePerHour: json["price_per_hour"],
        estimatedHours: json["estimated_hours"],
        date: json["date"],
        skill: json["skill"],
        postedBy: json["posted_by"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "state": state,
        "price_per_hour": pricePerHour,
        "estimated_hours": estimatedHours,
        "date": date,
        "skill": skill,
        "posted_by": postedBy,
    };
}
