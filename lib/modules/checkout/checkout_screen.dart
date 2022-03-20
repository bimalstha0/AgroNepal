import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../animations/loading.dart';
import '../widgets/custom_button.dart';
import 'checkout_controller.dart';
import 'widgets/order_summary.dart';
import 'widgets/payment_method.dart';
import 'widgets/shipping_address.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Out'),
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? Center(child: Loading())
            : Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          OrderSummary(controller.cartItems),
                          ShippingAddress(),
                          Obx(() => PaymentMethodContainer(
                              isCOD: controller.isCOD.value))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Obx(() => controller.isCOD.isTrue
                        ? CustomButton('Confirm Order', () {
                            controller.checkout();
                          })
                        : CustomButton('Pay Now', () {
                            controller.checkout();
                          })),
                  )
                ],
              ),
      ),
    );
  }
}
