import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../data/models/plant/plant.dart';

class PlantStats extends StatelessWidget {
  const PlantStats({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/icons/soil.png',
              height: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plant.soilType,
                  style: TextStyle(color: greenDark.withOpacity(0.5)),
                ),
                Text(
                  "Soil Type",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
        Row(
          children: [
            Image.asset(
              'assets/icons/sun.png',
              height: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plant.temp,
                  style: TextStyle(color: greenDark.withOpacity(0.5)),
                ),
                Text(
                  "Temperature",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
        Row(
          children: [
            Image.asset(
              'assets/icons/water.png',
              height: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plant.water,
                  style: TextStyle(color: greenDark.withOpacity(0.5)),
                ),
                Text(
                  "Water/day",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
