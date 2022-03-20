import 'package:agro_nepal/constants.dart';
import 'package:agro_nepal/modules/cart_tab/cart_screen.dart';
import 'package:agro_nepal/modules/explore_tab/explore_tab_controller.dart';
import 'package:agro_nepal/modules/home_tab/home_screen.dart';
import 'package:agro_nepal/modules/animations/splash_screen.dart';
import 'package:agro_nepal/modules/shop_tab/shop_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modules/favourites_tab/favorite_controller.dart';
import 'modules/app_controller.dart';
import 'modules/auth/change_password/change_password_screen.dart';
import 'modules/auth/login/login_screen.dart';
import 'modules/auth/register/register_screen.dart';
import 'modules/cart_tab/cart_controller.dart';
import 'modules/edit_profile/edit_profile_scrceen.dart';
import 'modules/order_tab/order_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPref = await SharedPreferences.getInstance();
  await Future.delayed(Duration(seconds: -100));
  runApp(AgroNepal(sharedPref));
}

class AgroNepal extends StatelessWidget {
  const AgroNepal(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: bgColor,
              foregroundColor: Colors.black,
              elevation: 0),
          scaffoldBackgroundColor: bgColor,
          primaryColor: greenColor,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme.apply(bodyColor: textColor),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      title: "AgroNepal",
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(AppController(sharedPreferences), permanent: true);
        Get.put(ShopTabController());
        Get.put(ExploreTabController());
        Get.put(FavoriteController(), permanent: true);
        Get.put(OrderController());
        Get.put(CartController(), permanent: true);
      }),
      //home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/changePassword': (context) => const ChangePasswordScreen(),
        '/editProfile': (context) => const EditProfileScreen(),
        '/cart': (context) => const CartScreen(),
      },
    );
  }
}
