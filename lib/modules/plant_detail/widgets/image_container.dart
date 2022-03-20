import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../data/models/plant/plant.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade200,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 275,
      child: Center(
        child: CachedNetworkImage(
          imageUrl: imageUrl + plant.image,
        ),
      ),
    );
  }
}
