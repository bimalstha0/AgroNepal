import 'package:agro_nepal/constants.dart';
import 'package:agro_nepal/modules/widgets/custom_button.dart';
import 'package:agro_nepal/modules/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../animations/loading.dart';
import 'edit_profile_controller.dart';
import 'widgets/profile_info.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              ProfileInfo(),
              SizedBox(
                height: 50,
              ),
              InputField(
                label: "Name",
                textInputAction: TextInputAction.next,
                controller: controller.nameController,
              ),
              SizedBox(
                height: 20,
              ),
              InputField(
                label: "Email",
                inputType: TextInputType.emailAddress,
                controller: controller.emailController,
              ),
              SizedBox(height: 50),
              Obx(
                () => controller.isLoading.isTrue
                    ? Loading(
                        size: 100,
                      )
                    : Center(
                        child: CustomButton(
                            "Confirm Changes", controller.editProfile)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
