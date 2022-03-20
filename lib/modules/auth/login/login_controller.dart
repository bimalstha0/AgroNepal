import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../data/api/auth_api.dart';
import '../../app_controller.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      Get.rawSnackbar(
          message: 'All fields are required.', backgroundColor: greenColor);
      return;
    }
    isLoading(true);
    try {
      var response = await AuthApi.login(username: email, password: password);
      isLoading(false);
      Get.back();
      Get.rawSnackbar(
          message: 'Login Successful.', backgroundColor: greenColor);

      Get.find<AppController>().login(response);
    } catch (e) {
      String errorMessage;
      isLoading(false);
      if (e.toString().contains('SocketException')) {
        errorMessage = 'No Internet Connection.';
      } else {
        // errorMessage = 'Failed to Load Data.';
        errorMessage = e.toString();
      }
      Get.rawSnackbar(message: errorMessage, backgroundColor: greenColor);
    }
  }

  @override
  void onClose() {
    passwordController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
