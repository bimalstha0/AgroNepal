import 'dart:convert';

import '../../constants.dart';
import '../models/product/product.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  static Future<List<Product>> getProducts() async {
    final url = baseUrl + "products/";
    print(url);
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      final products = data as List;
      return products.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
