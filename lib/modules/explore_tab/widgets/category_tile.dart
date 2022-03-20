import 'package:agro_nepal/data/models/plant/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../explore_category/explore_category,.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({required this.category});

  final Category category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ExploreCategory(
              categoryIndex: category.categoryId,
            ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 10),
          ],
        ),
        child: Row(children: [
          Image.asset(
            category.icon,
            height: 30,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            category.categoryName,
            style: const TextStyle(
                color: greenDark, fontWeight: FontWeight.bold, fontSize: 14),
          ))
        ]),
      ),
    );
  }
}
