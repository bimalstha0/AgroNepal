import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/plant/plant.dart';
import '../../favourites_tab/favorite_controller.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({required this.plant});
  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(builder: (favoriteController) {
      return favoriteController.plantFavorites
                  .firstWhereOrNull((element) => element.id == plant.id) ==
              null
          ? InkWell(
              onTap: () {
                favoriteController.addPlantFavorite(plant);
              },
              child: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  minRadius: 30,
                  child: Padding(
                      padding: EdgeInsets.all(8),
                      child:
                          Image.asset("assets/icons/heart.png", height: 35))))
          : InkWell(
              onTap: () {
                favoriteController.removePlantFavorite(plant);
              },
              child: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  minRadius: 30,
                  child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.asset("assets/icons/heart_filled.png",
                          height: 35))),
            );
    });
  }
}
