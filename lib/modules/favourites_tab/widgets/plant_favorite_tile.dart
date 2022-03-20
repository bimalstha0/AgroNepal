import 'package:agro_nepal/modules/favourites_tab/widgets/plant_favorite_icon.dart';
import 'package:agro_nepal/modules/plant_detail/plant_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../data/models/plant/plant.dart';

class PlantFavoriteTile extends StatelessWidget {
  const PlantFavoriteTile({required this.plant});
  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => PlantDetailScreen(plant: plant)),
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
              imageUrl: imageUrl + plant.image,
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
                    plant.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    plant.scName,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/temp.png",
                        height: 25,
                      ),
                      Text(
                        plant.temp,
                        style: TextStyle(
                            fontSize: 12, color: Colors.black.withOpacity(0.5)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          PlantFavoriteIcon(
            plant: plant,
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