import 'package:agro_nepal/constants.dart';
import 'package:agro_nepal/modules/animations/loading.dart';
import 'package:agro_nepal/modules/widgets/custom_button.dart';
import 'package:agro_nepal/modules/widgets/input_field.dart';
import 'package:agro_nepal/modules/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/social_card_login.dart';
import '../login/login_screen.dart';
import 'register_controller.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text("Register Account",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: greenDark,
                    )),
                const Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                InputField(
                  label: "Full Name",
                  textInputAction: TextInputAction.next,
                  controller: controller.nameController,
                ),
                const SizedBox(
                  height: 30,
                ),
                InputField(
                  label: "Email",
                  inputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: controller.emailController,
                ),
                const SizedBox(
                  height: 30,
                ),
                PasswordField(
                  label: "Password",
                  controller: controller.passwordController,
                ),
                const SizedBox(
                  height: 30,
                ),
                PasswordField(
                  label: "Confirm Password",
                  controller: controller.confirmPasswordController,
                ),
                const SizedBox(height: 50),
                Center(
                    child: Obx(() => controller.isLoading.isTrue
                        ? Loading(
                            size: 100,
                          )
                        : CustomButton("Register", controller.register))),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: 'assets/icons/google.png',
                      press: () {},
                    ),
                    SocialCard(
                      icon: 'assets/icons/facebook.png',
                      press: () {},
                    ),
                    SocialCard(
                      icon: 'assets/icons/twitter.png',
                      press: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
