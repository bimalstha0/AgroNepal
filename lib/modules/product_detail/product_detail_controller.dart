import 'package:get/get.dart';

import '../../data/models/product/product.dart';
import '../cart_tab/cart_controller.dart';

class ProductDetailController extends GetxController {
  final count = 1.obs;
  late final Product product;

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  void increment() {
    count.value++;
  }

  Future<void> addToCart() async {
    Get.find<CartController>().addToCart(product, quantity: count.value);
  }
}
