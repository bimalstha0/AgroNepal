import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../product_detail_controller.dart';

class ProductCounter extends StatelessWidget {
  const ProductCounter();
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductDetailController>();
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            //border: Border.all(color: Colors.grey)
            color: Colors.grey.shade300),
        child: Row(
          children: [
            InkWell(
              onTap: controller.decrement,
              child: const Icon(
                Icons.remove,
                color: greenColor,
                size: 18,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 7),
              constraints: BoxConstraints(minWidth: 30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300)),
              child:
                  Center(child: Obx(() => Text("${controller.count.value}"))),
            ),
            InkWell(
              onTap: controller.increment,
              child: const Icon(
                Icons.add,
                color: greenColor,
                size: 18,
              ),
            ),
          ],
        ));
  }
}
