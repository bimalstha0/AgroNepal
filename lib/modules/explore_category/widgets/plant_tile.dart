import 'package:agro_nepal/data/models/plant/plant.dart';
import 'package:agro_nepal/modules/plant_detail/plant_detail.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../favourites_tab/favorite_controller.dart';

class PlantTile extends StatelessWidget {
  const PlantTile({required this.plant});
  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => PlantDetailScreen(plant: plant));
      },
      child: Container(
        margin: EdgeInsets.all(10),
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
            Expanded(
                child: Center(
              child: CachedNetworkImage(
                imageUrl: imageUrl + plant.image,
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/apple.jpg',
                  fit: BoxFit.cover,
                ),
                height: 140,
                width: 140,
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
                      plant.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Spacer(),
                    GetBuilder<FavoriteController>(
                        builder: (favoriteController) {
                      return favoriteController.plantFavorites.firstWhereOrNull(
                                  (element) => element.id == plant.id) ==
                              null
                          ? InkWell(
                              child: Image.asset(
                                'assets/icons/heart.png',
                                height: 23,
                              ),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Added to favorites'),
                                      duration: Duration(milliseconds: 1200),
                                      backgroundColor: greenDark),
                                );
                                Get.find<FavoriteController>()
                                    .addPlantFavorite(plant);
                              },
                            )
                          : InkWell(
                              child: Image.asset(
                                'assets/icons/heart_filled.png',
                                height: 23,
                              ),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Removed from favorites'),
                                      duration: Duration(milliseconds: 1200),
                                      backgroundColor: greenDark),
                                );

                                Get.find<FavoriteController>()
                                    .removePlantFavorite(plant);
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
