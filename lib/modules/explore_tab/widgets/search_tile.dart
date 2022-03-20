import 'package:agro_nepal/constants.dart';
import 'package:agro_nepal/modules/plant_detail/plant_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/plant/plant.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({required this.plant});
  final Plant plant;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => PlantDetailScreen(plant: plant));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl + plant.image,
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/apple.jpg',
                    fit: BoxFit.cover,
                  ),
                  height: 40,
                  width: 40,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    plant.name,
                    style: const TextStyle(
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
