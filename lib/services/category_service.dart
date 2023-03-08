import 'dart:convert';

import 'package:grobox/models/category.dart';
import 'package:grobox/models/product.dart';
import 'package:grobox/services/base_service.dart';

class CategoryService {
  static Future<List<Category>> getCategories() async {
    final response = await BaseService.makeUnauthenticatedRequest(
        "${BaseService.BASE_URL}/items/category",
        method: "GET");
    if (response.statusCode == 200) {
      var usersJson = jsonDecode(response.body);
      return List<Category>.from(
        usersJson["data"].map(
          (use) => Category.fromJson(use),
        ),
      );
    } else {
      return [];
    }
  }
}
