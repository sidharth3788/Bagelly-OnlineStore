import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainproject/assets/colors/colors.dart';
import 'package:mainproject/controller/cart_controller.dart';
import 'package:mainproject/model/shop_items.dart';
import 'package:mainproject/view/cart_screen.dart';

class ScreenProductDetails extends StatelessWidget {
  final ShopItem product;

  const ScreenProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          product.title,
          style: TextStyle(color: UIColors.main),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: UIColors.main,
            ),
            onPressed: () {
              Get.to(ScreenCart());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image,
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: UIColors.main),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Rating: ${product.rating.rate.toString()} (${product.rating.count} reviews)',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green.shade600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${product.price.toString()}',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red.shade600,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.description,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() {
                  int quantity = cartController.cartItems[product] ?? 0;
                  return Text(
                    'Items in Cart: $quantity',
                    style: TextStyle(
                      color: UIColors.main,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
                ElevatedButton(
                  onPressed: () {
                    cartController.addToCart(product);

                    Get.snackbar(
                      'Added to Cart',
                      '${product.title} has been added to your cart.',
                      snackPosition: SnackPosition.TOP,
                      duration: const Duration(seconds: 1),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 50),
                      backgroundColor: UIColors.color2),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
