// To parse this JSON data, do
//
//     final deportes = deportesFromMap(jsonString);

import 'dart:convert';

class Deportes {
    Deportes({
      required  this.sports,
    });

    List<Sport> sports;

    factory Deportes.fromJson(String str) => Deportes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Deportes.fromMap(Map<String, dynamic> json) => Deportes(
        sports: List<Sport>.from(json["sports"].map((x) => Sport.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "sports": List<dynamic>.from(sports.map((x) => x.toMap())),
    };
}

class Sport {
    Sport({
      required  this.idSport,
      required  this.strSport,
      this.strFormat,
      required  this.strSportThumb,
      required  this.strSportIconGreen,
      required  this.strSportDescription,
    });

    String idSport;
    String strSport;
    StrFormat? strFormat;
    String strSportThumb;
    String strSportIconGreen;
    String strSportDescription;

    factory Sport.fromJson(String str) => Sport.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Sport.fromMap(Map<String, dynamic> json) => Sport(
        idSport: json["idSport"],
        strSport: json["strSport"],
        strFormat: strFormatValues.map[json["strFormat"]],
        strSportThumb: json["strSportThumb"],
        strSportIconGreen: json["strSportIconGreen"],
        strSportDescription: json["strSportDescription"],
    );

    Map<String, dynamic> toMap() => {
        "idSport": idSport,
        "strSport": strSport,
        "strFormat": strFormatValues.reverse[strFormat],
        "strSportThumb": strSportThumb,
        "strSportIconGreen": strSportIconGreen,
        "strSportDescription": strSportDescription,
    };
}

enum StrFormat { TEAMVS_TEAM, EVENT_SPORT }

final strFormatValues = EnumValues({
    "EventSport": StrFormat.EVENT_SPORT,
    "TeamvsTeam": StrFormat.TEAMVS_TEAM
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        // ignore: prefer_conditional_assignment, unnecessary_null_comparison
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => MapEntry(v, k));
        }
        return reverseMap;
    }
}
