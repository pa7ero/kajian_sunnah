// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

List<Category> categoryFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  int id;
  String name;
  dynamic description;
  dynamic parent;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.parent,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
