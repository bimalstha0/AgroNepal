import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/api/user_api.dart';
import '../../data/models/user_profile/user_profile.dart';
import '../app_controller.dart';

class EditProfileController extends GetxController {
  final isLoading = false.obs;
  late final TextEditingController nameController;
  late final TextEditingController emailController;

  @override
  void onInit() {
    UserProfile user = Get.find<AppController>().userProfile!;
    nameController = TextEditingController();
    emailController = TextEditingController();
    super.onInit();
  }

  Future<void> editProfile() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();

    if (name.isEmpty || email.isEmpty) {
      Get.rawSnackbar(message: 'All fields are required');
      return;
    }
    isLoading(true);
    try {
      var response = await UserApi.editProfile(email: email, name: name);
      isLoading(false);
      Get.back();
      Get.rawSnackbar(message: 'Changes Successful');
      Get.find<AppController>().updateProfile(response);
      nameController.text = "";
      emailController.text = "";
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
    emailController.dispose();
    super.onClose();
  }
}
