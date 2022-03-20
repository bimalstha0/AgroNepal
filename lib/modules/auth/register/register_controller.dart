import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/auth_api.dart';
import '../../app_controller.dart';

class RegisterController extends GetxController {
  final isLoading = false.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> register() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Get.rawSnackbar(message: 'All fields are required');
      return;
    }

    if (confirmPassword != password) {
      Get.rawSnackbar(message: 'Password does not match.');
      return;
    }
    isLoading(true);
    try {
      var response =
          await AuthApi.register(name: name, email: email, password: password);
      isLoading(false);
      Get.back();
      Get.back();
      Get.rawSnackbar(message: 'Registration Successful');
      Get.find<AppController>().login(response);
    } catch (e) {
      isLoading(false);
      print(e.toString());
      String errorMessage;
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = e.toString();
        // errorMessage = 'Failed to load data.';
      }
      Get.rawSnackbar(message: errorMessage);
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
