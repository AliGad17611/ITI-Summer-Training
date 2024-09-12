import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/category_screen.dart';
import 'package:e_commerce/screens/favorite_screen.dart';
import 'package:e_commerce/screens/home_screen.dart';
import 'package:e_commerce/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List<Widget> screens = const [
    HomeScreen(),
    FavoriteScreen(),
    CategoryScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(
            Icons.home,
            size: 30,
            color: kDefaultColor,
          ),
          Icon(
            Icons.favorite,
            size: 30,
            color: kDefaultColor,
          ),
          Icon(
            Icons.category,
            size: 30,
            color: kDefaultColor,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: kDefaultColor,
          ),
        ],
        height: 50,
        color: kPrimaryColor,
        buttonBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: screens[currentIndex],
    );
  }
}
