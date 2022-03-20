import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api/user_api.dart';
import '../data/models/auth/login_response.dart';
import '../data/models/user_profile/user_profile.dart';
import 'order_tab/order_controller.dart';

class AppController extends GetxController {
  final isLoggedIn = false.obs;
  AppController(this.sharedPreferences) {
    String? token = sharedPreferences.getString('token');
    if (token == '' || token == null) {
      isLoggedIn(false);
    } else {
      isLoggedIn(true);
      getUserProfile(token);
    }
  }
  final SharedPreferences sharedPreferences;
  UserProfile? userProfile;
  final isProfileLoading = false.obs;
  final isNoInternet = false.obs;

  void getUserProfile(String token) async {
    isProfileLoading(true);
    isNoInternet(false);
    try {
      userProfile = await UserApi.getProfile(token);
      Get.find<OrderController>().getOrder(token);
    } catch (e) {
      if (e.toString().contains('Socket Exception')) {
        isNoInternet(true);
      } else {
        logout();
      }
    }
    isProfileLoading(false);
  }

  void login(LoginResponse loginResponse) {
    isLoggedIn(true);
    userProfile = UserProfile(
        id: loginResponse.id,
        email: loginResponse.email,
        name: loginResponse.name);
    Get.find<OrderController>().getOrder(loginResponse.token ?? '');
  }

  void logout() {
    sharedPreferences.setString('token', '');
    isLoggedIn(false);
  }

  void updateProfile(UserProfile user) {
    userProfile = user;
    update();
  }

  String getToken() {
    return sharedPreferences.getString('token') ?? '';
  }
}
