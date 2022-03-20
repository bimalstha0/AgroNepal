import 'package:agro_nepal/modules/contact_us/contact_us_page.dart';
import 'package:agro_nepal/modules/order_tab/order_screen.dart';
import 'package:agro_nepal/modules/profile_tab/widgets/widgets/profile_category.dart';
import 'package:agro_nepal/modules/profile_tab/widgets/widgets/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text('Profile')),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () => appController.isLoggedIn.isFalse
                      ? Divider(
                          thickness: 1,
                        )
                      : Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: ProfileInfo(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ProfileCategory(
                              icon: Icons.edit,
                              text: "Edit Profile",
                              onPress: () {
                                Navigator.pushNamed(context, '/editProfile');
                              },
                            ),
                            ProfileCategory(
                              icon: Icons.lock_outline,
                              text: "Reset Password",
                              onPress: () {
                                Navigator.pushNamed(context, '/changePassword');
                              },
                            ),
                            ProfileCategory(
                              icon: Icons.receipt_long_outlined,
                              text: "Order History",
                              onPress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const OrderScreen()));
                              },
                            ),
                          ],
                        ),
                ),
                Column(
                  children: [
                    ProfileCategory(
                      icon: Icons.mail_outline,
                      text: "Contact Us",
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactForm()));
                      },
                    ),
                    Obx(() => appController.isLoggedIn.isTrue
                        ? ProfileCategory(
                            icon: Icons.logout_outlined,
                            text: "Log Out",
                            onPress: () {
                              Get.find<AppController>().logout();
                              ;
                            },
                          )
                        : ProfileCategory(
                            icon: Icons.logout_outlined,
                            text: "Log In",
                            onPress: () {
                              Navigator.pushNamed(context, '/login');
                            },
                          )),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          )),
    );
  }
}
