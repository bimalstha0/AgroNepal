import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../modules/app_controller.dart';
import '../models/order/order.dart';
import '../models/order/order_detail.dart';
import '../models/order/order_request.dart';

class OrderApi {
  static Future<List<Order>> getOrders(String token) async {
    final url = baseUrl + "orders/history/";
    final response = await http.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      final orders = data as List;
      return orders.map((product) => Order.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }

  static Future<OrderDetails> getOrderDetails(int id) async {
    final url = baseUrl + "orders/$id";
    String token = Get.find<AppController>().getToken();
    final response = await http.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      return OrderDetails.fromJson(data);
    } else {
      throw Exception('Failed to load orders');
    }
  }

  static Future<OrderDetails> confirmOrder(OrderRequest orderRequest) async {
    final url = baseUrl + "orders/confirm/";
    String token = Get.find<AppController>().getToken();
    final request = jsonEncode(orderRequest.toJson());
    final response = await http.post(
      Uri.parse(url),
      body: request,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $token",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return OrderDetails.fromJson(data);
    } else {
      throw Exception("Something went wrong");
    }
  }
}
