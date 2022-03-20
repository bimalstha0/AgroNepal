import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../data/models/product/cart_item.dart';
import '../cart_controller.dart';

class DeleteCart extends StatelessWidget {
  const DeleteCart({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: const Text('Remove the item from cart?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: greenColor),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.find<CartController>()
                            .removeFromCart(cartItem.product);

                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Remove',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ));
      },
      child: const Padding(
        padding: EdgeInsets.all(5),
        child: Icon(
          Icons.delete_outlined,
          color: Colors.grey,
        ),
      ),
    );
  }
}
