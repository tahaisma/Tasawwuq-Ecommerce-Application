import 'package:ecommerce/controller/all_products_controller.dart';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart'; // استورد ملف الـ routes
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductsPage extends StatelessWidget {
  const AllProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AllProductsController controller = Get.put(AllProductsController());
    final FavoriteController favoriteController =
        Get.find<FavoriteController>();
    final CartController cartController = Get.find<CartController>();

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text(
                  'Confirm exit',
                  style: TextStyle(color: AppColor.secoundColor),
                ),
                content: const Text('Are you sure you want to exit the app?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text(
                      'no',
                      style: TextStyle(color: AppColor.secoundColor),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text(
                      'yes',
                      style: TextStyle(color: AppColor.secoundColor),
                    ),
                  ),
                ],
              ),
        );
        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "All Products",
            style: TextStyle(color: AppColor.primaryColor),
          ),
        ),
        body: Obx(
          () =>
              controller.allProducts.isEmpty
                  ? const Center(child: Text("No products found"))
                  : GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.50,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                    itemCount: controller.allProducts.length,
                    itemBuilder: (context, index) {
                      final product = controller.allProducts[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(
                            AppRoute
                                .productDetils, // استخدم الـ route المعرف لصفحة التفاصيل
                            arguments:
                                product, // ابعت بيانات المنتج كـ arguments
                          );
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: double.infinity,
                                  child:
                                      product.containsKey('image') &&
                                              product['image'] != null
                                          ? Image.asset(
                                            product['image'],
                                            fit: BoxFit.cover,
                                          )
                                          : const Placeholder(),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  product['title'] ?? 'اسم غير متوفر',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  product['description'] ?? 'لا يوجد وصف',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  product['price'] ?? 'سعر غير متوفر',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.red,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                        Text(
                                          ' (${product['rating'] ?? '0.0'})',
                                        ),
                                      ],
                                    ),
                                    Obx(
                                      () => IconButton(
                                        icon: Icon(
                                          favoriteController.isFavorite(
                                                product['title'],
                                              )
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          favoriteController.toggleFavorite(
                                            product['title'],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                ElevatedButton(
                                  onPressed: () {
                                    cartController.addItem(product['title']);
                                    Get.snackbar(
                                      'Success',
                                      '${product['title'] ?? 'المنتج'} added to cart!',
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    foregroundColor: Colors.white,
                                    minimumSize: const Size(
                                      double.infinity,
                                      30,
                                    ),
                                  ),
                                  child: const Text('Add to cart'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
        ),
      ),
    );
  }
}
