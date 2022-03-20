import 'package:agro_nepal/data/models/product/product.dart';
import 'package:flutter/material.dart';
import 'product_counter.dart';
import 'image_container.dart';
import 'product_detail_container.dart';

class BodyContainer extends StatelessWidget {
  const BodyContainer({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageContainer(image: product.image),
          Text(
            product.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductCounter(),
              Text(
                'Rs ${product.price}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          ProductDetailContainer(description: product.description)
        ],
      ),
    ));
  }
}
