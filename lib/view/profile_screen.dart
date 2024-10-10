import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainproject/assets/colors/colors.dart';
import 'package:mainproject/view/signin_screen.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            CircleAvatar(
              radius: 60,
              backgroundImage: const AssetImage('lib/assets/img/user.avif'),
              backgroundColor: Colors.grey[200],
            ),
            Text(
              'Sidharth P',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: UIColors.main),
            ),
            Text(
              'sidharth@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
              label: const Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: UIColors.color2,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.favorite, color: UIColors.main),
              title: Text(
                'Wishlist',
                style: TextStyle(color: UIColors.main),
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.shopping_bag, color: UIColors.main),
              title: Text(
                'Order History',
                style: TextStyle(color: UIColors.main),
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.privacy_tip, color: UIColors.main),
              title: Text(
                'Privacy Policy',
                style: TextStyle(color: UIColors.main),
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.help, color: UIColors.main),
              title: Text(
                'Help & Support',
                style: TextStyle(color: UIColors.main),
              ),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.settings, color: UIColors.main),
              title: Text(
                'Settings',
                style: TextStyle(color: UIColors.main),
              ),
              onTap: () {},
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: () {
                Get.to(ScreensignIn());
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              label: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
