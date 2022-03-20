import 'package:agro_nepal/modules/animations/error.dart';
import 'package:agro_nepal/modules/animations/loading.dart';
import 'package:agro_nepal/modules/shop_tab/widget/product_tiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../data/models/product/product.dart';
import 'shop_tab_controller.dart';
import 'widget/custom_search_diligate.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget getProducts(
      List<Product> product,
    ) {
      return GridView.builder(
        itemCount: product.length,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return ProductTiles(product: product[index]);
        },
      );
    }

    final controller = Get.find<ShopTabController>();
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Shop"),
            actions: <Widget>[
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
                  ProductCategoryTile(
                    icon: 'assets/icons/allproduct.png',
                    label: 'All',
                  ),
                  ProductCategoryTile(
                    icon: 'assets/icons/seed.png',
                    label: 'Seeds',
                  ),
                  ProductCategoryTile(
                    icon: 'assets/icons/fertilizer.png',
                    label: 'Fertilizers',
                  ),
                  ProductCategoryTile(
                    icon: 'assets/icons/groceries.png',
                    label: 'Groceries',
                  ),
                  ProductCategoryTile(
                    icon: 'assets/icons/traditional_tools.png',
                    label: 'Traditional Tools',
                  ),
                  ProductCategoryTile(
                    icon: 'assets/icons/modern_tools.png',
                    label: 'Modern Tools',
                  ),
                ]),
          ),
          body: TabBarView(
            children: [
              Obx(
                () => controller.isLoading.isTrue
                    ? Center(child: Loading(size: 300))
                    : controller.isError.isTrue
                        ? ErrorPage(
                            errorMessage: controller.errorMessage,
                            onRetry: controller.getProducts,
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: getProducts(controller.products),
                          ),
              ),
              Obx(
                () => controller.isLoading.isTrue
                    ? Center(child: Loading(size: 300))
                    : controller.isError.isTrue
                        ? ErrorPage(
                            errorMessage: controller.errorMessage,
                            onRetry: controller.getProducts,
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: getProducts(controller.products
                                .where((element) => element.category == "Seeds")
                                .toList())),
              ),
              Obx(
                () => controller.isLoading.isTrue
                    ? Center(child: Loading(size: 300))
                    : controller.isError.isTrue
                        ? ErrorPage(
                            errorMessage: controller.errorMessage,
                            onRetry: controller.getProducts,
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: getProducts(controller.products
                                .where((element) =>
                                    element.category == "Fertilizers")
                                .toList())),
              ),
              Obx(
                () => controller.isLoading.isTrue
                    ? Center(child: Loading(size: 300))
                    : controller.isError.isTrue
                        ? ErrorPage(
                            errorMessage: controller.errorMessage,
                            onRetry: controller.getProducts,
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: getProducts(controller.products
                                .where((element) =>
                                    element.category == "Groceries")
                                .toList())),
              ),
              Obx(
                () => controller.isLoading.isTrue
                    ? Center(child: Loading(size: 300))
                    : controller.isError.isTrue
                        ? ErrorPage(
                            errorMessage: controller.errorMessage,
                            onRetry: controller.getProducts,
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: getProducts(controller.products
                                .where((element) =>
                                    element.category == "Traditional Tools")
                                .toList())),
              ),
              Obx(
                () => controller.isLoading.isTrue
                    ? Center(child: Loading(size: 300))
                    : controller.isError.isTrue
                        ? ErrorPage(
                            errorMessage: controller.errorMessage,
                            onRetry: controller.getProducts,
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: getProducts(controller.products
                                .where((element) =>
                                    element.category == "Modern Tools")
                                .toList())),
              ),
            ],
          ),
        ));
  }
}

class ProductCategoryTile extends StatelessWidget {
  const ProductCategoryTile({required this.icon, required this.label});
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
