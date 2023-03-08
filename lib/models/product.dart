// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

import 'package:grobox/services/base_service.dart';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.id,
    this.status,
    this.name,
    this.price,
    this.sizes,
    this.icon,
    this.description,
    this.category,
  });

  String? id;
  String? status;
  String? name;
  int? price;
  List<String>? sizes;
  String? icon;
  String? description;
  String? category;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        status: json["status"],
        name: json["name"],
        price: json["price"],
        sizes: List<String>.from(json["sizes"].map((x) => x)),
        icon: "${BaseService.BASE_URL}/assets/${json["icon"]}?quality=20",
        description: json["description"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "name": name,
        "price": price,
        "sizes": List<dynamic>.from(sizes!.map((x) => x)),
        "icon": icon,
        "description": description,
        "category": category,
      };
}
