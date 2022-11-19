// To parse this JSON data, do
//
//     final watchList = watchListFromJson(jsonString);

import 'dart:convert';

List<WatchList> watchListFromJson(String str) => List<WatchList>.from(json.decode(str).map((x) => WatchList.fromJson(x)));

String watchListToJson(List<WatchList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WatchList {
    WatchList({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model model;
    int pk;
    Fields fields;

    factory WatchList.fromJson(Map<String, dynamic> json) => WatchList(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.title,
        required this.releaseDate,
        required this.rating,
        required this.description,
        required this.watched,
    });

    String title;
    String releaseDate;
    int rating;
    String description;
    bool watched;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        title: json["title"],
        releaseDate: json["release_date"],
        rating: json["rating"],
        description: json["description"],
        watched: json["watched"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "release_date": releaseDate,
        "rating": rating,
        "description": description,
        "watched": watched,
    };
}

enum Model { MYWATCHLIST_MYWATCHLIST }

final modelValues = EnumValues({
    "mywatchlist.mywatchlist": Model.MYWATCHLIST_MYWATCHLIST
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap;
        return reverseMap;
    }
}