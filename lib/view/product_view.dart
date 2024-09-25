import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainproject/assets/colors/colors.dart';
import 'package:mainproject/controller/cart_controller.dart';
import 'package:mainproject/controller/shop_controller.dart';
import 'package:mainproject/model/shop_items.dart';
import 'product_detail_view.dart';

class ScreenProducts extends StatelessWidget {
  final ShopController shopController = Get.put(ShopController());
  final CartController cartController = Get.put(CartController());

  ScreenProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: UIColors.main,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Products',
          style: TextStyle(color: UIColors.color3, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          if (shopController.products.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: shopController.products.length,
            itemBuilder: (context, index) {
              ShopItem product = shopController.products[index];
              return Card(
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    Get.to(() => ScreenProductDetails(product: product));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: UIColors.main,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              product.image,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(
                                    Icons.error,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                '\$${product.price.toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: UIColors.main,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(UIColors.color2),
                              ),
                              onPressed: () {
                                cartController.addToCart(product);
                                Get.snackbar(
                                  'Added to Cart',
                                  '${product.title} has been added to your cart.',
                                  snackPosition: SnackPosition.TOP,
                                  duration: const Duration(seconds: 1),
                                );
                              },
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
