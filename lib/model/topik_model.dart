// To parse this JSON data, do
//
//     final topik = topikFromJson(jsonString);

import 'dart:convert';

Topik topikFromJson(String str) => Topik.fromJson(json.decode(str));

String topikToJson(Topik data) => json.encode(data.toJson());

class Topik {
  int? id;
  String? name;
  dynamic description;
  dynamic parent;

  Topik({
    required this.id,
    required this.name,
    required this.description,
    required this.parent,
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
