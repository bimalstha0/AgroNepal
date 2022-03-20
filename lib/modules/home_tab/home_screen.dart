import 'package:agro_nepal/constants.dart';
import 'package:agro_nepal/modules/favourites_tab/favourite_screen.dart';
import 'package:agro_nepal/modules/cart_tab/cart_screen.dart';
import 'package:agro_nepal/modules/profile_tab/profile_screen.dart';
import 'package:agro_nepal/modules/shop_tab/shop_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:agro_nepal/modules/explore_tab/explore_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> screens = [
    ExploreScreen(),
    FavoriteScreen(),
    ShopScreen(),
    CartScreen(),
    ProfileScreen()
  ];
  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.white,
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            BottomNavyBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: greenDark.withOpacity(0.8),
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: greenDark.withOpacity(0.8)),
                ),
                activeColor: Colors.grey.withOpacity(0.1)),
            BottomNavyBarItem(
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: greenDark.withOpacity(0.8),
                ),
                title: Text(
                  'My plants',
                  style: TextStyle(color: greenDark.withOpacity(0.8)),
                ),
                activeColor: Colors.grey.withOpacity(0.1)),
            BottomNavyBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: greenDark.withOpacity(0.8),
                ),
                title: Text(
                  'Shop',
                  style: TextStyle(color: greenDark),
                ),
                activeColor: Colors.grey.withOpacity(0.1)),
            BottomNavyBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: greenDark.withOpacity(0.8),
                ),
                title: Text(
                  'My Cart',
                  style: TextStyle(
                    color: greenDark.withOpacity(0.8),
                  ),
                ),
                activeColor: Colors.grey.withOpacity(0.1)),
            BottomNavyBarItem(
                icon: Icon(
                  Icons.person_outline_outlined,
                  color: greenDark.withOpacity(0.8),
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(color: greenDark.withOpacity(0.8)),
                ),
                activeColor: Colors.grey.withOpacity(0.1)),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: screens,
        ));
  }
}

// BottomNavigationBar(
//           currentIndex: _selectedIndex,
//           onTap: (index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           },
//           // elevation: 0,
//           // showSelectedLabels: false,
//           unselectedItemColor: greyColor,
//           selectedItemColor: greenColor,
//           items: [
//             _bottomNavigationBarItem(Icons.home_outlined, 'Home'),
//             _bottomNavigationBarItem(Icons.favorite_outline, 'My Plants'),
//             _bottomNavigationBarItem(Icons.shopping_bag_outlined, 'Shop'),
//             _bottomNavigationBarItem(Icons.shopping_cart_outlined, 'Cart'),
//             _bottomNavigationBarItem(Icons.person_outlined, 'Profile'),
//           ],
//         ),