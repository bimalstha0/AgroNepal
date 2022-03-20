import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../data/models/product/product.dart';
import '../../favourites_tab/favorite_controller.dart';
import '../product_detail_controller.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: greenColor.withOpacity(0.1),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: MaterialButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Added to cart"),
                    duration: Duration(milliseconds: 1200),
                    backgroundColor: greenColor,
                  ));

                  Get.find<ProductDetailController>().addToCart();
                },
                child: const Text(
                  'Add To Cart',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                color: greenColor,
                elevation: 0,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GetBuilder<FavoriteController>(builder: (favoriteController) {
              return favoriteController.productFavorites.firstWhereOrNull(
                          (element) => element.id == product.id) ==
                      null
                  ? InkWell(
                      onTap: () {
                        favoriteController.addProductFavorite(product);
                      },
                      child: Image.asset(
                        'assets/icons/heart.png',
                        height: 30,
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        favoriteController.removeProductFavorite(product);
                      },
                      child: Image.asset(
                        'assets/icons/heart_filled.png',
                        height: 30,
                      ));
            }),
          ],
        ));
  }
}
