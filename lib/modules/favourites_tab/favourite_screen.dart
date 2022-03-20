import 'package:agro_nepal/modules/favourites_tab/widgets/plant_search_diligate.dart';
import 'package:agro_nepal/modules/favourites_tab/widgets/product_favorite_tile.dart';
import 'package:agro_nepal/modules/favourites_tab/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import 'favorite_controller.dart';
import 'widgets/plant_favorite_tile.dart';
import 'widgets/product_sarch_diligate.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Favorites'),
            bottom: TabBar(
                indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                isScrollable: false,
                indicatorColor: greenDark,
                labelColor: greenDark,
                labelStyle: TextStyle(fontSize: 17),
                labelPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                tabs: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/plant.png',
                        height: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("My Plants")
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/product.png',
                        height: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(" My Products")
                    ],
                  )
                ]),
          ),
          body: TabBarView(children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SearchBar(delegate: PlantSearchDelegate(), label: "plants"),
                SizedBox(
                  height: 15,
                ),
                GetBuilder<FavoriteController>(builder: (controller) {
                  return controller.plantFavorites.isEmpty
                      ? const Center(
                          child: Text('You have no favorites'),
                        )
                      : Expanded(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.plantFavorites.length,
                            itemBuilder: (context, index) => PlantFavoriteTile(
                              plant: controller.plantFavorites[index],
                            ),
                          ),
                        );
                })
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SearchBar(delegate: ProductSearchDelegate(), label: "products"),
                SizedBox(
                  height: 15,
                ),
                GetBuilder<FavoriteController>(builder: (controller) {
                  return controller.productFavorites.isEmpty
                      ? const Center(
                          child: Text('You have no favorites'),
                        )
                      : Expanded(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.productFavorites.length,
                            itemBuilder: (context, index) =>
                                ProductFavoriteTile(
                                    product:
                                        controller.productFavorites[index]),
                          ),
                        );
                })
              ],
            )
          ]),
        ));
  }
}
