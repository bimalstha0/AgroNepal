import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../data/models/product/cart_item.dart';
import 'delete_cart.dart';
import 'product_counter.dart';

class CartItemTile extends StatelessWidget {
  final CartItem cartItem;
  const CartItemTile(
    this.cartItem, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl + cartItem.product.image,
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/apple.jpg',
                  fit: BoxFit.cover,
                ),
                width: 50,
                height: 50,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItem.product.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ProductCounter(cartItem),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  DeleteCart(cartItem: cartItem),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Rs ${cartItem.product.price * cartItem.quantity}')
                ],
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 2,
        )
      ],
    );
  }
}
