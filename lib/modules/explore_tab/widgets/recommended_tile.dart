import 'package:agro_nepal/data/models/plant/category.dart';
import 'package:agro_nepal/data/models/plant/plant.dart';
import 'package:agro_nepal/modules/plant_detail/plant_detail.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../favourites_tab/favorite_controller.dart';

class RecommendedTile extends StatelessWidget {
  const RecommendedTile({required this.recommended});
  final Plant recommended;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => PlantDetailScreen(plant: recommended));
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, bottom: 20, top: 20),
        height: 300,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                offset: Offset(0, 7),
                blurRadius: 10),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "POPULAR",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Center(
              child: CachedNetworkImage(
                imageUrl: imageUrl + recommended.image,
              ),
            )),
            BlurryContainer(
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
              bgColor: Colors.white,
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      recommended.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Spacer(),
                    GetBuilder<FavoriteController>(
                        builder: (favoriteController) {
                      return favoriteController.plantFavorites.firstWhereOrNull(
                                  (element) => element.id == recommended.id) ==
                              null
                          ? InkWell(
                              child: Image.asset(
                                'assets/icons/heart.png',
                                height: 25,
                              ),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Added to favorites'),
                                      duration: Duration(milliseconds: 1200),
                                      backgroundColor: greenDark),
                                );
                                favoriteController
                                    .addPlantFavorite(recommended);
                              },
                            )
                          : InkWell(
                              child: Image.asset(
                                'assets/icons/heart_filled.png',
                                height: 25,
                              ),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Removed from favorites'),
                                      duration: Duration(milliseconds: 1200),
                                      backgroundColor: greenDark),
                                );

                                favoriteController
                                    .removePlantFavorite(recommended);
                              },
                            );
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
