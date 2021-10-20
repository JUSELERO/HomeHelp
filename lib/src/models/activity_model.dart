// To parse this JSON data, do
//
//     final activity = activityFromJson(jsonString);

import 'dart:convert';

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));

String activityToJson(Activity data) => json.encode(data.toJson());

class Activity {
    Activity({
        this.id,
        this.title,
        this.description,
        this.state,
        this.priceHour,
        this.hours,
        this.priceTotal,
        this.date,
        this.skillId,
        this.profileId,
    });

    String id;
    String title;
    String description;
    String state;
    int priceHour;
    int hours;
    int priceTotal;
    String date;
    String skillId;
    String profileId;

    factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        state: json["state"],
        priceHour: json["price_hour"],
        hours: json["hours"],
        priceTotal: json["price_total"],
        date: json["date"],
        skillId: json["skill_id"],
        profileId: json["profile_id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "state": state,
        "price_hour": priceHour,
        "hours": hours,
        "price_total": priceTotal,
        "date": date,
        "skill_id": skillId,
        "profile_id": profileId,
    };
}
