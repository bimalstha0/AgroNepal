import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../animations/loading.dart';
import '../../../app_controller.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appController = Get.find<AppController>();
    return Column(
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(
            "assets/images/profile.jpg",
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Obx(
          () => appController.isProfileLoading.isTrue
              ? Loading(
                  size: 50,
                )
              : appController.isNoInternet.isTrue
                  ? ElevatedButton(
                      onPressed: () {
                        String? token =
                            appController.sharedPreferences.getString('token');
                        appController.getUserProfile(token ?? '');
                      },
                      child: Text('Try Again'))
                  : GetBuilder<AppController>(
                      builder: (controller) {
                        return Column(
                          children: [
                            Text(
                              controller.userProfile!.name ?? '',
                              style: TextStyle(
                                  color: greenDark,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              controller.userProfile!.email ?? '',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 12),
                            ),
                          ],
                        );
                      },
                    ),
        )
      ],
    );
  }
}
