import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'custom_search_diligate.dart';
import 'text_slider.dart';

class ExploreHeader extends StatelessWidget {
  const ExploreHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          const Text(
            "Explore",
            style: TextStyle(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Container(
            child: IconButton(
              icon: const Icon(Icons.search),
              color: greenDark,
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
            ),
          )
        ],
      ),
      Divider(
        thickness: 1,
        color: greenDark.withOpacity(0.5),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextSlider(),
      ),
    ]);
  }
}
