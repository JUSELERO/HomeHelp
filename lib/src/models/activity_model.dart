// To parse this JSON data, do
//
//     final activityModel = activityModelFromJson(jsonString);

import 'dart:convert';

ActivityModel activityModelFromJson(String str) => ActivityModel.fromJson(json.decode(str));

String activityModelToJson(ActivityModel data) => json.encode(data.toJson());

class ActivityModel {
    ActivityModel({
        this.id,
        this.title,
        this.description,
        this.state,
        this.pricePerHour,
        this.estimatedHours,
        this.creationDate,
        this.date,
        this.skill,
        this.postedBy,
        this.namePosted,
    });

    String id;
    String title;
    String description;
    int state;
    int pricePerHour;
    int estimatedHours;
    String creationDate;
    String date;
    String skill;
    String postedBy;
    String namePosted;

    factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        state: json["state"],
        pricePerHour: json["price_per_hour"],
        estimatedHours: json["estimated_hours"],
        creationDate: json["creation_date"],
        date: json["date"],
        skill: json["skill"],
        postedBy: json["posted_by"],
        namePosted: json["name_posted"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "state": state,
        "price_per_hour": pricePerHour,
        "estimated_hours": estimatedHours,
        "creation_date": creationDate,
        "date": date,
        "skill": skill,
        "posted_by": postedBy,
        "namePosted": namePosted
    };
}
