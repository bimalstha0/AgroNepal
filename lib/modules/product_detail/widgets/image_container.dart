import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 300,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: greenColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CachedNetworkImage(
            imageUrl: imageUrl + image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
