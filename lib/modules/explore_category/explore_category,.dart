import 'package:agro_nepal/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/plant/plant.dart';
import '../animations/error.dart';
import '../animations/loading.dart';
import '../explore_tab/explore_tab_controller.dart';
import '../explore_tab/widgets/custom_search_diligate.dart';
import 'widgets/plant_tile.dart';

class ExploreCategory extends StatelessWidget {
  const ExploreCategory({
    required this.categoryIndex,
  });

  final int categoryIndex;

  @override
  Widget build(BuildContext context) {
    Widget getPlants(
      List<Plant> plant,
    ) {
      return GridView.builder(
          itemCount: plant.length,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return PlantTile(plant: plant[index]);
          });
    }

    final controller = Get.find<ExploreTabController>();
    return DefaultTabController(
      length: 5,
      initialIndex: categoryIndex - 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Explore",
            style: TextStyle(fontSize: 18),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: greenDark,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {
                    showSearch(
                        context: context, delegate: CustomSearchDelegate());
                  },
                  icon: Icon(
                    Icons.search_rounded,
                    color: greenDark,
                  )),
            )
          ],
          bottom: const TabBar(
              isScrollable: true,
              indicatorColor: greenDark,
              labelColor: greenDark,
              labelStyle: TextStyle(fontSize: 17),
              labelPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              physics: BouncingScrollPhysics(),
              tabs: [
                PlantCategoryTile(
                  icon: 'assets/icons/plant.png',
                  label: 'All',
                ),
                PlantCategoryTile(
                  icon: 'assets/icons/fruit.png',
                  label: 'Fruits',
                ),
                PlantCategoryTile(
                  icon: 'assets/icons/vegetable.png',
                  label: 'Vegetables',
                ),
                PlantCategoryTile(
                  icon: 'assets/icons/food_crop.png',
                  label: 'Food Crops',
                ),
                PlantCategoryTile(
                  icon: 'assets/icons/cash_crop.png',
                  label: 'Cash Crops',
                ),
              ]),
        ),
        body: TabBarView(children: [
          Obx(
            () => controller.isLoading.isTrue
                ? Center(child: Loading(size: 300))
                : controller.isError.isTrue
                    ? ErrorPage(
                        errorMessage: controller.errorMessage,
                        onRetry: controller.getPlants,
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: getPlants(controller.plants)),
          ),
          Obx(
            () => controller.isLoading.isTrue
                ? Center(child: Loading(size: 300))
                : controller.isError.isTrue
                    ? ErrorPage(
                        errorMessage: controller.errorMessage,
                        onRetry: controller.getPlants,
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: getPlants(controller.plants
                            .where((element) => element.category == "Fruits")
                            .toList())),
          ),
          Obx(
            () => controller.isLoading.isTrue
                ? Center(child: Loading(size: 300))
                : controller.isError.isTrue
                    ? ErrorPage(
                        errorMessage: controller.errorMessage,
                        onRetry: controller.getPlants,
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: getPlants(controller.plants
                            .where(
                                (element) => element.category == "Vegetables")
                            .toList())),
          ),
          Obx(
            () => controller.isLoading.isTrue
                ? Center(child: Loading(size: 300))
                : controller.isError.isTrue
                    ? ErrorPage(
                        errorMessage: controller.errorMessage,
                        onRetry: controller.getPlants,
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: getPlants(controller.plants
                            .where(
                                (element) => element.category == "Food Crops")
                            .toList())),
          ),
          Obx(
            () => controller.isLoading.isTrue
                ? Center(child: Loading(size: 300))
                : controller.isError.isTrue
                    ? ErrorPage(
                        errorMessage: controller.errorMessage,
                        onRetry: controller.getPlants,
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: getPlants(controller.plants
                            .where(
                                (element) => element.category == "Cash Crops")
                            .toList())),
          ),
        ]),
      ),
    );
  }
}

class PlantCategoryTile extends StatelessWidget {
  const PlantCategoryTile({required this.icon, required this.label});
  final String icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          height: 20,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          label,
        ),
      ],
    );
  }
}

// Container(
//                     height: 150,
//                     width: 100,
//                     margin: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey.withOpacity(0.4),
//                             spreadRadius: 1,
//                             blurRadius: 10),
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         Image.asset(
//                           plants[index].image,
//                           height: 200,
//                         )
//                       ],
//                     ),
//                   );