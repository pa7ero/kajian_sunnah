// To parse this JSON data, do
//
//     final ustadz = ustadzFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

List<Ustadz> ustadzFromJson(String str) =>
    List<Ustadz>.from(json.decode(str).map((x) => Ustadz.fromJson(x)));

String ustadzToJson(List<Ustadz> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ustadz {
  final int id;
  final String name;
  final String shortBio;
  final String description;

  Ustadz({
    required this.id,
    required this.name,
    required this.shortBio,
    required this.description,
  });

  factory Ustadz.fromJson(Map<String, dynamic> json) => Ustadz(
        id: json["id"],
        name: json["name"],
        shortBio: json["short_bio"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_bio": shortBio,
        "description": description,
      };
}
