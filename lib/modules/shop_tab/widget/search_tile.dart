import 'package:agro_nepal/modules/product_detail/product_detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../data/models/product/product.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => ProductDetailScreen(), arguments: product),
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl + product.image,
                  height: 40,
                  width: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
