import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TextSlider extends StatelessWidget {
  const TextSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        SizedBox(
          height: 45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Agriculture BUT The Smart Way.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              Text(
                'Learn about your crops all you want.',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
        SizedBox(
          height: 45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Find the appropriate climate',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              Text(
                'Efficient Farming',
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ],
      //Slider Container properties
      options: CarouselOptions(
        viewportFraction: 1,
        height: 50,
        disableCenter: true,
        scrollDirection: Axis.vertical,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlay: true,
      ),
    );
  }
}
