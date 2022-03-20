import 'dart:ui';

import 'package:agro_nepal/constants.dart';
import 'package:agro_nepal/modules/contact_us/contact_us_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/plant/plant.dart';
import '../plant_detail/widgets/image_container.dart';
import 'widgets/favorite_icon.dart';
import 'widgets/plant_detail_container.dart';

class PlantDetailScreen extends StatelessWidget {
  const PlantDetailScreen({required this.plant});
  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Text(
            plant.name,
          ),
          backgroundColor: Colors.grey.shade200,
        ),
        body: Stack(
          children: [
            Positioned(
                top: 0,
                child: ImageContainer(
                  plant: plant,
                )),
            Positioned(top: 275, child: PlantDetailContainer(plant: plant)),
            Positioned(top: 245, right: 20, child: FavoriteIcon(plant: plant)),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 70,
                child: Column(
                  children: [
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Need Our Help?"),
                        TextButton(
                            onPressed: () {
                              Get.to(() => ContactForm());
                            },
                            child: const Text(
                              "Contact Us",
                              style: TextStyle(color: greenDark),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
