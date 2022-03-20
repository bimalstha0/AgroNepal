import 'package:agro_nepal/modules/explore_tab/widgets/search_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/plant/plant.dart';
import '../../explore_category/widgets/plant_tile.dart';
import '../explore_tab_controller.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
        inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none, focusedBorder: InputBorder.none));
  }

  List<Plant> plants = Get.find<ExploreTabController>().plants;

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
    List<Plant> matchedResults = [];
    for (Plant item in plants) {
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
                    return PlantTile(plant: matchedResults[index]);
                  }),
            ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Plant> matchedReults = [];
    for (Plant item in plants) {
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
              return SearchTile(plant: matchedReults[index]);
            }));
  }
}
