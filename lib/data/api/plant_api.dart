import 'dart:convert';
import '../../constants.dart';
import 'package:http/http.dart' as http;

import '../models/plant/plant.dart';

class PlantApi {
  static Future<List<Plant>> getPlants() async {
    final url = baseUrl + "plants/";
    print(url);
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      final plants = data as List;
      return plants.map((plant) => Plant.fromJson(plant)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
