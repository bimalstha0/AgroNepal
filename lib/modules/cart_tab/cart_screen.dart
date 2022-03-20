import 'package:agro_nepal/modules/cart_tab/widgets/product_counter.dart';
import 'package:agro_nepal/modules/checkout/checkout_screen.dart';
import 'package:agro_nepal/modules/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../app_controller.dart';
import '../auth/login/login_screen.dart';
import 'cart_controller.dart';
import 'widgets/cart_item_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
        ),
        body: GetBuilder<CartController>(builder: (controller) {
          return controller.cartItems.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/emptyCart.svg',
                          height: 150),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Your cart is empty.'),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.cartItems.length,
                        itemBuilder: (context, index) {
                          return CartItemTile(controller.cartItems[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomButton(
                          "Checkout (Rs. ${Get.find<CartController>().total.value})",
                          () {
                        if (Get.find<AppController>().isLoggedIn.isTrue) {
                          Get.to(() => CheckoutScreen(),
                              arguments: controller.cartItems);
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text('Login'),
                                    content:
                                        const Text('Please login to continue.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Get.to(() => LoginScreen());
                                        },
                                        child: const Text(
                                          'Login',
                                          style: TextStyle(color: greenColor),
                                        ),
                                      ),
                                    ],
                                  ));
                        }
                      }),
                    )
                  ],
                );
        }));
  }
}
