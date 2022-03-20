import 'package:agro_nepal/constants.dart';
import 'package:agro_nepal/modules/widgets/custom_button.dart';
import 'package:agro_nepal/modules/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../animations/loading.dart';
import 'change_password_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangePasswordController());
    TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/update_new_password_icon.png',
                height: 150,
              ),
              const Text(
                "RESET PASSWORD",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              PasswordField(
                label: "Old Password",
                controller: controller.oldPasswordController,
              ),
              const SizedBox(
                height: 30,
              ),
              PasswordField(
                label: "New Password",
                controller: controller.newPasswordController,
              ),
              const SizedBox(
                height: 30,
              ),
              PasswordField(
                label: "Confirm Password",
                controller: controller.confirmPasswordController,
              ),
              const SizedBox(height: 50),
              Obx(
                () => Get.find<ChangePasswordController>().isLoading.isTrue
                    ? Loading(
                        size: 100,
                      )
                    : Center(
                        child: CustomButton(
                            "Change Password", controller.changePassword)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
