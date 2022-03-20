import 'dart:convert';

import 'package:get/get.dart';

import '../../constants.dart';
import '../../modules/app_controller.dart';
import '../models/user_profile/edit_profile_request.dart';
import '../models/user_profile/user_profile.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<UserProfile> getProfile(String token) async {
    final url = baseUrl + "users/profile/";
    print(token);
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      UserProfile userProfile = UserProfile.fromJson(data);
      return userProfile;
    } else {
      print(response.body);
      throw Exception("Something went wrong");
    }
  }

  static Future<UserProfile> editProfile({
    required String name,
    required String email,
  }) async {
    final url = baseUrl + "users/profile/update/";
    final request =
        jsonEncode(EditProfileRequest(name: name, email: email).toJson());
    String? token =
        Get.find<AppController>().sharedPreferences.getString('token');
    final response = await http.put(
      Uri.parse(url),
      body: request,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      UserProfile userProfile = UserProfile.fromJson(data);
      return userProfile;
    } else {
      print(response.body);
      throw Exception("Something went wrong");
    }
  }
}
