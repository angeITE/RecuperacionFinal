// To parse this JSON data, do
//
//     final ligas = ligasFromMap(jsonString);

import 'dart:convert';

class Ligas {
    Ligas({
      required  this.leagues,
    });

    List<League> leagues;

    factory Ligas.fromJson(String str) => Ligas.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Ligas.fromMap(Map<String, dynamic> json) => Ligas(
        leagues: List<League>.from(json["leagues"].map((x) => League.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "leagues": List<dynamic>.from(leagues.map((x) => x.toMap())),
    };
}

class League {
    League({
      required  this.idLeague,
      this.strLeague,
      this.strSport,
      this.strLeagueAlternate,
    });

    String idLeague;
    String? strLeague;
    String? strSport;
    String? strLeagueAlternate;

    factory League.fromJson(String str) => League.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory League.fromMap(Map<String, dynamic> json) => League(
        idLeague: json["idLeague"],
        strLeague: json["strLeague"],
        strSport: json["strSport"],
        strLeagueAlternate: json["strLeagueAlternate"] == null ? null : json["strLeagueAlternate"],
    );

    Map<String, dynamic> toMap() => {
        "idLeague": idLeague,
        "strLeague": strLeague,
        "strSport": strSport,
        "strLeagueAlternate": strLeagueAlternate == null ? null : strLeagueAlternate,
    };
}
