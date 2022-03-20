import 'package:get/get.dart';

import '../../data/local/cart_local.dart';
import '../../data/models/product/cart_item.dart';
import '../../data/models/product/product.dart';

class CartController extends GetxController {
  List<CartItem> cartItems = [];

  final total = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getCart();
  }

  Future<void> getCart() async {
    cartItems = await CartLocal.get();
    calculateTotal();
    update();
  }

  void calculateTotal() {
    double newTotal = 0;
    cartItems.forEach((element) {
      newTotal += (element.quantity * element.product.price);
    });
    total(newTotal);
  }

  Future<void> updateCart() async {
    CartLocal.set(cartItems);
    calculateTotal();
  }

  Future<void> addToCart(Product product, {int quantity = 1}) async {
    if (cartItems
            .firstWhereOrNull((element) => element.product.id == product.id) ==
        null) {
      cartItems.add(CartItem(product, quantity));
    } else {
      int index =
          cartItems.indexWhere((element) => element.product.id == product.id);
      cartItems[index].quantity += quantity;
    }
    updateCart();
    update();
  }

  Future<void> removeFromCart(Product product) async {
    cartItems.removeWhere((element) => element.product.id == product.id);
    updateCart();
    update();
  }

  Future<void> changeQuantity(CartItem cartItem) async {
    int index = cartItems
        .indexWhere((element) => element.product.id == cartItem.product.id);
    cartItems[index].quantity = cartItem.quantity;
    updateCart();
    update();
  }

  void clearCart() {
    cartItems = [];
    updateCart();
    update();
  }
}
