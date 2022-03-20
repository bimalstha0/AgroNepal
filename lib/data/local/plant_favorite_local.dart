import 'dart:convert';

import 'package:get/get.dart';

import '../../modules/app_controller.dart';
import '../models/plant/plant.dart';
import '../models/product/product.dart';

class PlantFavoriteLocal {
  static String key = "plantFavoriteLocal";

  static Future<List<Plant>> get() async {
    var prefs = Get.find<AppController>().sharedPreferences;
    var valueString = prefs.getString(key);
    try {
      if (valueString == null || valueString == '') {
        return [];
      }
      var data = json.decode(valueString);
      final plants = data as List;
      return plants.map((plant) => Plant.fromJson(plant)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<bool> set(List<Plant> favorites) async {
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
