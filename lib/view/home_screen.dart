import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainproject/assets/colors/colors.dart';
import 'package:mainproject/controller/cart_controller.dart';
import 'package:mainproject/view/cart_screen.dart';
import 'package:mainproject/view/category_screen.dart';
import 'package:mainproject/view/product_view.dart';
import 'package:mainproject/view/profile_screen.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  ScreenHomeState createState() => ScreenHomeState();
}

class ScreenHomeState extends State<ScreenHome> {
  int currentIndex = 0;

  final CartController cartController = Get.put(CartController());

  final List<Widget> _pages = [
    const ScreenProducts(),
    const ScreenCategory(),
    ScreenCart(),
    const ScreenProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        backgroundColor: UIColors.main,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
