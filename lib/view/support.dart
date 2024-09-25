import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainproject/assets/colors/colors.dart';
import 'package:mainproject/view/signin_screen.dart';

class ScreenSupport extends StatelessWidget {
  const ScreenSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.main,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'contact creator for username & password',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Image.asset('lib/assets/img/logo.png'),
            ElevatedButton(
              onPressed: () {
                Get.to(ScreenSignIn());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: UIColors.color2,
                foregroundColor: UIColors.color3,
              ),
              child: const Text(
                'continue',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
