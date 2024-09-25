import 'package:flutter/material.dart';
import 'package:mainproject/assets/colors/colors.dart';
import 'package:mainproject/view/cart_screen.dart';
import 'package:mainproject/view/product_view.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  ScreenHomeState createState() => ScreenHomeState();
}

class ScreenHomeState extends State<ScreenHome> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    ScreenProducts(),
    ScreenCart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: UIColors.main,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: UIColors.main,
            ),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
