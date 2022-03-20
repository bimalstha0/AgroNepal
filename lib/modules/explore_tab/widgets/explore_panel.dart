import 'package:agro_nepal/modules/plant_detail/plant_detail.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../data/models/plant/plant.dart';

class ExplorePanel extends StatelessWidget {
  const ExplorePanel({
    required this.plant,
  });
  final Plant plant;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => PlantDetailScreen(plant: plant)),
      child: Container(
        margin: EdgeInsets.only(bottom: 6),
        color: bgColor,
        width: double.infinity,
        height: 400,
        child: Stack(
          children: [
            Positioned(
                right: -15,
                top: 50,
                bottom: 0,
                child: CachedNetworkImage(
                  imageUrl: imageUrl + plant.image,
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/corn.png',
                    fit: BoxFit.cover,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FAVORABLE',
                    style: TextStyle(
                      color: greenDark,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    plant.name,
                    style: TextStyle(
                        color: greenDark,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    plant.scName.toUpperCase(),
                    style: TextStyle(
                        color: greenDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                    decoration: BoxDecoration(
                        color: greenDark,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      plant.temp,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: BlurryContainer(
                borderRadius: BorderRadius.zero,
                bgColor: greenDark,
                blur: 15,
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Get suitable fertilizer for this plant.',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      Container(
                        height: 30,
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            'BUY',
                            style: TextStyle(color: greenDark, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
