// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

import 'package:grobox/services/base_service.dart';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
    Category({
        this.id,
        this.status,
        this.name,
        this.price,
        this.icon,
        this.description,
        this.category,
    });

    String? id;
    String? status;
    String? name;
    int? price;
    String? icon;
    String? description;
    String? category;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        status: json["status"],
        name: json["name"],
        price: json["price"],
        icon: "${BaseService.BASE_URL}/assets/${json["icon"]}?quality=20",
        description: json["description"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "name": name,
        "price": price,
        "icon": icon,
        "description": description,
        "category": category,
    };
}
