import 'package:get/get.dart';

import '../../data/api/order_api.dart';
import '../../data/models/order/order.dart';

class OrderController extends GetxController {
  final isLoading = false.obs;
  final isError = false.obs;

  String errorMessage = "";

  List<Order> orders = [];

  Future<void> getOrder(String token) async {
    isLoading(true);
    isError(false);
    try {
      orders = await OrderApi.getOrders(token);
      print(orders.length);
      isLoading(false);
    } catch (e) {
      isLoading(false);
      isError(true);
      print(e.toString());
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = 'Failed to load data.';
      }
    }
  }
}
