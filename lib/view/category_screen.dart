import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainproject/assets/colors/colors.dart';
import 'package:mainproject/controller/cart_controller.dart';
import 'package:mainproject/controller/shop_controller.dart';
import 'package:mainproject/model/shop_items.dart';
import 'product_detail_view.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({super.key});

  @override
  ScreenCategoryState createState() => ScreenCategoryState();
}

class ScreenCategoryState extends State<ScreenCategory> {
  final ShopController shopController = Get.put(ShopController());
  final CartController cartController = Get.put(CartController());

  String selectedCategory = 'All Products';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryChip('Mens Clothing', 'men\'s clothing'),
                    _buildCategoryChip('Womens Clothing', 'women\'s clothing'),
                    _buildCategoryChip('Jewelry', 'jewelery'),
                    _buildCategoryChip('Electronics', 'electronics'),
                    _buildCategoryChip('All Products', 'All Products'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                if (shopController.products.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                List<ShopItem> filteredProducts = shopController.products;
                if (selectedCategory != 'All Products') {
                  filteredProducts = shopController.products
                      .where((product) =>
                          product.category == selectedCategory.toLowerCase())
                      .toList();
                }

                if (filteredProducts.isEmpty) {
                  return const Center(child: Text('No products available.'));
                }

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    ShopItem product = filteredProducts[index];
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: UIColors.color2,
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
                                    child: const Text(
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
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, String category) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ChoiceChip(
        label: Text(
          label,
          style: TextStyle(
            color: selectedCategory == category ? Colors.white : Colors.white,
          ),
        ),
        selected: selectedCategory == category,
        backgroundColor: UIColors.main,
        selectedColor: UIColors.color2,
        onSelected: (selected) {
          setState(() {
            selectedCategory = category;
          });
        },
      ),
    );
  }
}
