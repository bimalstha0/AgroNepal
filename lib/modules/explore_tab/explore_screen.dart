import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/plant/category.dart';
import '../../data/models/plant/plant.dart';
import '../explore_tab/widgets/category_tile.dart';
import '../shop_tab/shop_tab_controller.dart';
import 'explore_tab_controller.dart';
import 'widgets/explore_header.dart';
import 'widgets/explore_panel.dart';
import 'widgets/recommended_tile.dart';

final List<Category> categories = [
  Category(
      categoryId: 2, categoryName: "Fruits", icon: "assets/icons/fruit.png"),
  Category(
      categoryId: 3,
      categoryName: "Vegetables",
      icon: "assets/icons/vegetable.png"),
  Category(
      categoryId: 4,
      categoryName: "Food Crops",
      icon: "assets/icons/food_crop.png"),
  Category(
      categoryId: 5,
      categoryName: "Cash Crops",
      icon: "assets/icons/cash_crop.png"),
  Category(categoryId: 1, categoryName: "All", icon: "assets/icons/plant.png"),
];

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ExploreTabController>();
    List<Plant> favorable =
        controller.plants.where((element) => element.id < 3).toList();
    print(favorable.length);
    List<Plant> recommended =
        controller.plants.where((element) => element.id < 6).toList();
    print(recommended.length);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(left: 20, bottom: 5, right: 20, top: 30),
                child: ExploreHeader(),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ExplorePanel(plant: favorable[index]);
                },
                itemCount: favorable.length,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 14),
                child: Text(
                  "Recommended",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 375,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return RecommendedTile(
                      recommended: recommended[index],
                    );
                  },
                  itemCount: recommended.length,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  "Browse By Types",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: ((context, index) => CategoryTile(
                      category: categories[index],
                    )),
                itemCount: 5,
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
