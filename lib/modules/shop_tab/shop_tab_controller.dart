import 'package:get/get.dart';

import '../../data/api/product_api.dart';
import '../../data/models/product/product.dart';

class ShopTabController extends GetxController {
  final isLoading = false.obs;
  final isError = false.obs;

  String errorMessage = "";

  List<Product> products = [];

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  Future<void> getProducts() async {
    isLoading(true);
    isError(false);
    try {
      products = await ProductApi.getProducts();
      // print(products.length);
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
