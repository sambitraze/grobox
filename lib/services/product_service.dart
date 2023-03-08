import 'dart:convert';

import 'package:grobox/models/product.dart';
import 'package:grobox/services/base_service.dart';

class ProductService {
  static Future<List<Product>> getProducts() async {
    final response = await BaseService.makeUnauthenticatedRequest(
        "${BaseService.BASE_URL}/items/product",
        method: "GET");
    if (response.statusCode == 200) {
      var usersJson = jsonDecode(response.body);
      return List<Product>.from(
        usersJson["data"].map(
          (use) => Product.fromJson(use),
        ),
      );
    } else {
      return [];
    }
  }

  static Future<List<Product>> getPopularProducts() async {
    final response = await BaseService.makeUnauthenticatedRequest(
        "${BaseService.BASE_URL}/items/product?filter[set_popular]=true",
        method: "GET");
    if (response.statusCode == 200) {
      var usersJson = jsonDecode(response.body);
      return List<Product>.from(
        usersJson["data"].map(
          (use) => Product.fromJson(use),
        ),
      );
    } else {
      return [];
    }
  }

  static Future<List<Product>> getNewArrivals() async {
    final response = await BaseService.makeUnauthenticatedRequest(
        "${BaseService.BASE_URL}/items/product?sort[]=-date_created&limit=2",
        method: "GET");
    if (response.statusCode == 200) {
      var usersJson = jsonDecode(response.body);
      return List<Product>.from(
        usersJson["data"].map(
          (use) => Product.fromJson(use),
        ),
      );
    } else {
      return [];
    }
  }

  static Future<List<Product>> getProductsByCategory(String category) async {
    final response = await BaseService.makeUnauthenticatedRequest(
        "${BaseService.BASE_URL}/items/product?filter[category]=$category",
        method: "GET");
    if (response.statusCode == 200) {
      var usersJson = jsonDecode(response.body);
      return List<Product>.from(
        usersJson["data"].map(
          (use) => Product.fromJson(use),
        ),
      );
    } else {
      return [];
    }
  }
}
