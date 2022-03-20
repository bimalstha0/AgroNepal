import 'package:agro_nepal/data/models/product/product.dart';
import 'package:agro_nepal/modules/cart_tab/cart_controller.dart';
import 'package:agro_nepal/modules/product_detail/product_detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../animations/loading.dart';
import '../../product_detail/product_detail_controller.dart';

class ProductTiles extends StatelessWidget {
  const ProductTiles({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailScreen(), arguments: product);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: Offset(1, 1),
                blurRadius: 1,
                spreadRadius: 2)
          ],
        ),
        height: 180,
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: CachedNetworkImage(
                    imageUrl: imageUrl + product.image,
                    placeholder: (context, url) => const Loading(size: 120),
                    errorWidget: (context, url, error) => Image.asset(
                          'assets/images/apple.png',
                          fit: BoxFit.cover,
                        ),
                    height: 120,
                    width: 120),
              ),
            ),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Rs. ${product.price} ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                          child: InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Added to cart"),
                            duration: Duration(milliseconds: 1200),
                            backgroundColor: greenColor,
                          ));

                          Get.find<CartController>().addToCart(product);
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
