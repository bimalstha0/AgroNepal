import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/api/order_api.dart';
import '../../data/models/order/order_request.dart';
import '../../data/models/product/cart_item.dart';
import '../app_controller.dart';
import '../cart_tab/cart_controller.dart';
import '../order_tab/order_controller.dart';
import 'order_success/order_success.dart';

class CheckoutController extends GetxController {
  final isLoading = false.obs;
  late final List<CartItem> cartItems;
  final isCOD = true.obs;

  late final TextEditingController phoneController;
  late final TextEditingController cityController;
  late final TextEditingController addressController;

  final List<String> provinces = [
    'Province 1',
    'Madesh Province',
    'Bagmati Province',
    'Gandaki Province',
    'Lumbini Province',
    'Karnali Province',
    'Sudurpaschim Province'
  ];

  String? selectedProvince;

  Map<String, String>? shippingAddress;
  String? fullAddress;

  // late final ESewaConfiguration _configuration;
  // late final ESewaPnp _eSewaPnp;

  @override
  void onInit() {
    super.onInit();
    cartItems = Get.arguments;
    phoneController = TextEditingController();
    cityController = TextEditingController();
    addressController = TextEditingController();

    // _configuration = ESewaConfiguration(
    //     clientID: "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
    //     secretKey: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
    //     environment: ESewaConfiguration.ENVIRONMENT_TEST);

    // _eSewaPnp = ESewaPnp(configuration: _configuration);
  }

  Future<void> checkout() async {
    if (shippingAddress == null) {
      showSnackBar('Empty Shiping Address', "Please Enter Shipping Address");
      return;
    }

    isLoading(true);
    try {
      List<OrderItems> orderItems = List.generate(
          cartItems.length,
          (index) => OrderItems(
              product: cartItems[index].product.id,
              quantity: cartItems[index].quantity));
      OrderRequest orderRequest = OrderRequest(
          shippingAddress: fullAddress ?? '',
          phoneNumber: shippingAddress!['phone'] ?? '',
          paymentMethod: isCOD.isTrue ? 'COD' : 'eSewa',
          paymentStatus: isCOD.isFalse,
          orderItems: orderItems);
      if (isCOD.isFalse) {
        //await esewaPayment();
      }
      var orderResponse = await OrderApi.confirmOrder(orderRequest);
      Get.find<CartController>().clearCart();
      isLoading(false);
      String token = Get.find<AppController>().getToken();
      Get.find<OrderController>().getOrder(token);
      Get.off(() => OrderSucess(orderResponse));
    } catch (e) {
      isLoading(false);
      String errorMessage;
      print(e.toString());
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = e.toString();
        showSnackBar('Error', errorMessage);
      }
    }
  }

  // Future<void> esewaPayment() async {
  //   ESewaPayment _payment = ESewaPayment(
  //       amount: 500.0,
  //       productName: "Grocery Nepal",
  //       productID: "1",
  //       callBackURL: "");

  //   try {
  //     final _res = await _eSewaPnp.initPayment(payment: _payment);

  //     Get.snackbar("Success", _res.message ?? 'Payment Successful');
  //   } on ESewaPaymentException catch (e) {
  //     throw Exception(e.message);
  //   }
  // }

  void showSnackBar(String title, String message) {
    Get.snackbar(title, message, backgroundColor: Colors.red.withOpacity(0.8));
  }

  void updateAddress() {
    String phone = phoneController.text.trim();
    String city = cityController.text.trim();
    String address = addressController.text.trim();
    if (phone.isEmpty) {
      showSnackBar('Invalid Phone Number', 'Please Enter Valid Phone Number');
      return;
    }
    if (selectedProvince == null) {
      showSnackBar('Invalid Province name', 'Please Enter Valid Province ');
      return;
    }
    if (city.isEmpty) {
      showSnackBar('Invalid  City', 'Please Enter Valid City');
      return;
    }
    if (address.isEmpty) {
      Get.snackbar('Invalid Address', 'Please Enter Valid Address');
      return;
    }
    fullAddress = '$phone, $address, $city, $selectedProvince';
    shippingAddress = {
      'phone': phone,
      'city': city,
      'address': address,
      'province': selectedProvince!
    };
    update();
    Get.back();
  }
}
