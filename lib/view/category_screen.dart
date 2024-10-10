import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mainproject/assets/colors/colors.dart';
import 'package:mainproject/controller/shop_controller.dart';
import 'package:mainproject/model/shop_items.dart';
import 'product_detail_view.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({super.key});

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory> {
  String? selectedCategory = 'all products';
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'All Products',
      'value': 'all products',
    },
    {
      'title': 'Men\'s Clothing',
      'value': 'men\'s clothing',
    },
    {
      'title': 'Women\'s Clothing',
      'value': 'women\'s clothing',
    },
    {
      'title': 'Jewelry',
      'value': 'jewelery',
    },
    {
      'title': 'Electronics',
      'value': 'electronics',
    },
  ];

  final ShopController shopController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: UIColors.main),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Select Category',
                ),
                value: selectedCategory,
                items: categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category['value'],
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        Text(category['title']),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
                hint: const Text('Select a category'),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Obx(() {
                  List<ShopItem> filteredProducts;
                  if (selectedCategory == 'all products') {
                    filteredProducts = shopController.products.toList();
                  } else {
                    filteredProducts = shopController.products
                        .where((product) =>
                            product.category == selectedCategory?.toLowerCase())
                        .toList();
                  }

                  if (filteredProducts.isEmpty && selectedCategory != null) {
                    return const Center(child: Text('No products available.'));
                  }

                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.83,
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
                            Get.to(
                                () => ScreenProductDetails(product: product));
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
                                const SizedBox(height: 4),
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
                                      errorBuilder:
                                          (context, error, stackTrace) {
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
                                const SizedBox(height: 5),
                                Text(
                                  '\$${product.price.toString()}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.green,
                                  ),
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
      ),
    );
  }
}
