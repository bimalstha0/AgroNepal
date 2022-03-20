import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product/product.dart';
import '../../product_detail/product_detail_screen.dart';

class ProductSearchTile extends StatelessWidget {
  ProductSearchTile({required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailScreen(), arguments: product);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 60),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            product.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Divider(
            thickness: 1,
          )
        ]),
      ),
    );
  }
}
