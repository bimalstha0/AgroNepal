import 'package:get/get.dart';

import '../../data/api/plant_api.dart';
import '../../data/models/plant/plant.dart';

class ExploreTabController extends GetxController {
  final isLoading = false.obs;
  final isError = false.obs;

  String errorMessage = "";

  List<Plant> plants = [];

  @override
  void onInit() {
    super.onInit();
    getPlants();
  }

  Future<void> getPlants() async {
    isLoading(true);
    isError(false);
    try {
      plants = await PlantApi.getPlants();
      // print(plants.length);
      isLoading(false);
    } catch (e) {
      isLoading(false);
      isError(true);
      print(e.toString());
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = 'Failed to load data.';
      }
    }
  }
}
