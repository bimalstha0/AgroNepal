import 'package:agro_nepal/constants.dart';
import 'package:agro_nepal/modules/favourites_tab/widgets/product_favorite_icon.dart';
import 'package:agro_nepal/modules/product_detail/product_detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product/product.dart';

class ProductFavoriteTile extends StatelessWidget {
  ProductFavoriteTile({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailScreen(), arguments: product);
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  offset: Offset(1, 1),
                  blurRadius: 1,
                  spreadRadius: 2)
            ]),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CachedNetworkImage(
              imageUrl: imageUrl + product.image,
              height: 80,
              width: 80,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text("Rs ${product.price}")
                ],
              ),
            ),
          ),
          ProductFavoriteIcon(
            product: product,
          )
        ]),
      ),
    );
  }
}


// Scaffold(
//         body: SingleChildScrollView(
//           physics:
//               BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//           child: Padding(
//             padding: const EdgeInsets.only(left: 20, bottom: 20, top: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     const Text(
//                       "My plants",
//                       style: TextStyle(
//                           fontSize: 22,
//                           color: greenDark,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     const Spacer(),
//                     Container(
//                       child: IconButton(
//                         icon: const Icon(Icons.search),
//                         color: greenDark,
//                         onPressed: () {
//                           showSearch(
//                               context: context,
//                               delegate: CustomSearchDelegate());
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//                 const Divider(
//                   thickness: 2,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       return FavoriteTile();
//                     },
//                     itemCount: 5)
//               ],
//             ),
//           ),
//         ),
//       ),