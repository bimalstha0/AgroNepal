import 'package:agro_nepal/modules/shop_tab/widget/product_tiles.dart';
import 'package:agro_nepal/modules/shop_tab/widget/search_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product/product.dart';
import '../../shop_tab/shop_tab_controller.dart';

class ProductSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
        inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none, focusedBorder: InputBorder.none));
  }

  List<Product> products = Get.find<ShopTabController>().products;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          query = '';
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> matchedResults = [];
    for (Product item in products) {
      if (item.name.toLowerCase().contains(query.toLowerCase())) {
        matchedResults.add(item);
      }
    }
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: matchedResults.isEmpty
          ? Center(
              child: Text(
              "Sorry. No matches found.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ))
          : Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                  itemCount: matchedResults.length,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return ProductTiles(product: matchedResults[index]);
                  }),
            ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> matchedReults = [];
    for (Product item in products) {
      if (item.name.toLowerCase().contains(query.toLowerCase())) {
        matchedReults.add(item);
      }
    }
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: matchedReults.length < 5 ? matchedReults.length : 5,
            itemBuilder: (context, index) {
              return SearchTile(product: matchedReults[index]);
            }));
  }
}
