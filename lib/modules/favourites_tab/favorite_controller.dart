import 'package:get/get.dart';

import '../../data/local/plant_favorite_local.dart';
import '../../data/local/product_favorite_local.dart';
import '../../data/models/plant/plant.dart';
import '../../data/models/product/product.dart';

class FavoriteController extends GetxController {
  List<Product> productFavorites = [];
  List<Plant> plantFavorites = [];

  @override
  void onInit() {
    super.onInit();
    getProductFavorites();
    getPlantFavorites();
  }

  Future<void> getPlantFavorites() async {
    plantFavorites = await PlantFavoriteLocal.get();
    update();
  }

  Future<void> getProductFavorites() async {
    productFavorites = await ProductFavoriteLocal.get();
    update();
  }

  void addPlantFavorite(Plant plant) {
    plantFavorites.add(plant);
    PlantFavoriteLocal.set(plantFavorites);
    update();
  }

  void addProductFavorite(Product product) {
    productFavorites.add(product);
    ProductFavoriteLocal.set(productFavorites);
    update();
  }

  void removePlantFavorite(Plant plant) {
    plantFavorites.removeWhere((element) => element.id == plant.id);
    PlantFavoriteLocal.set(plantFavorites);
    update();
  }

  void removeProductFavorite(Product product) {
    productFavorites.removeWhere((element) => element.id == product.id);
    ProductFavoriteLocal.set(productFavorites);
    update();
  }
}
