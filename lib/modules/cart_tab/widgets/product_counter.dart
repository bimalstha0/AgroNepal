import 'package:agro_nepal/data/models/product/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../cart_controller.dart';

class ProductCounter extends StatelessWidget {
  const ProductCounter(this.item, {Key? key}) : super(key: key);
  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            if (item.quantity > 1) {
              Get.find<CartController>()
                  .changeQuantity(CartItem(item.product, item.quantity - 1));
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: greenColor,
            ),
            padding: const EdgeInsets.all(2),
            child: const Icon(
              Icons.remove,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Text('${item.quantity}'),
        ),
        InkWell(
          onTap: () {
            Get.find<CartController>()
                .changeQuantity(CartItem(item.product, item.quantity + 1));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: greenColor,
            ),
            padding: const EdgeInsets.all(2),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
