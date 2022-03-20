import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product_detail_controller.dart';
import 'widgets/body_container.dart';
import 'widgets/bottom_container.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailController());
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.product.name),
      ),
      body: Column(
        children: [
          Expanded(child: BodyContainer(product: controller.product)),
          BottomContainer(product: controller.product),
        ],
      ),
    );
  }
}
