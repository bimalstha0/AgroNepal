import 'dart:convert';

import 'package:get/get.dart';

import '../../modules/app_controller.dart';
import '../models/product/product.dart';

class ProductFavoriteLocal {
  static String key = "favoriteLocal";

  static Future<List<Product>> get() async {
    var prefs = Get.find<AppController>().sharedPreferences;
    var valueString = prefs.getString(key);
    try {
      if (valueString == null || valueString == '') {
        return [];
      }
      var data = json.decode(valueString);
      final products = data as List;
      return products.map((product) => Product.fromJson(product)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<bool> set(List<Product> favorites) async {
    var data = [];
    favorites.map((product) => product.toJson()).toList();
    var valueString = json.encode(data);
    try {
      var prefs = Get.find<AppController>().sharedPreferences;
      return await prefs.setString(key, valueString);
    } catch (e) {
      print(e);
      return false;
    }
  }
}
