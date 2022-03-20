import 'package:agro_nepal/modules/favourites_tab/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/plant/plant.dart';

class PlantFavoriteIcon extends StatelessWidget {
  PlantFavoriteIcon({required this.plant});
  final Plant plant;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FavoriteController>();
    return Column(
      children: [
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text("Remove from favorites?"),
                      // content: Text("Yes"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel')),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              controller.removePlantFavorite(plant);
                            },
                            child: Text("Yes"))
                      ],
                    ));
          },
          child: Padding(
            padding: EdgeInsets.all(17),
            child: Image.asset(
              "assets/icons/heart_filled.png",
              height: 20,
            ),
          ),
        ),
        Spacer()
      ],
    );
  }
}
