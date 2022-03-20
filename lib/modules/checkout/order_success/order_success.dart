import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../data/models/order/order_detail.dart';
import '../../order_detail/order_detail_screen.dart';
import '../../widgets/custom_button.dart';

class OrderSucess extends StatelessWidget {
  const OrderSucess(this.orderDetails, {Key? key}) : super(key: key);
  final OrderDetails orderDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/success.json',
                repeat: false, width: 200),
            const SizedBox(
              height: 20,
            ),
            Text('Order Success', style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 20,
            ),
            CustomButton('Check Order Details', () {
              Get.to(() => OrderDetailScreen(), arguments: orderDetails);
            }),
            TextButton(
              child: Text('Back to Home'),
              onPressed: () {
                Get.back();
              },
            )
          ],
        ),
      ),
    ));
  }
}
