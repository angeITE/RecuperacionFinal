// To parse this JSON data, do
//
//     final ciudades = ciudadesFromMap(jsonString);

import 'dart:convert';

class Ciudades {
    Ciudades({
      required  this.countries,
    });

    List<Country> countries;

    factory Ciudades.fromJson(String str) => Ciudades.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Ciudades.fromMap(Map<String, dynamic> json) => Ciudades(
        countries: List<Country>.from(json["countries"].map((x) => Country.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "countries": List<dynamic>.from(countries.map((x) => x.toMap())),
    };
}

class Country {
    Country({
      required  this.nameEn,
    });

    String nameEn;

    factory Country.fromJson(String str) => Country.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Country.fromMap(Map<String, dynamic> json) => Country(
        nameEn: json["name_en"],
    );

    Map<String, dynamic> toMap() => {
        "name_en": nameEn,
    };
}
