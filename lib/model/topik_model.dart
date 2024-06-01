// To parse this JSON data, do
//
//     final topik = topikFromJson(jsonString);

import 'dart:convert';

List<Topik> topikFromJson(String str) =>
    List<Topik>.from(json.decode(str).map((x) => Topik.fromJson(x)));

String topikToJson(List<Topik> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Topik {
  final int? id;
  final String? name;
  final dynamic description;
  final dynamic parent;

  Topik({
    this.id,
    this.name,
    this.description,
    this.parent,
  });

  factory Topik.fromJson(Map<String, dynamic> json) => Topik(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        parent: json["parent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "parent": parent,
      };
}
