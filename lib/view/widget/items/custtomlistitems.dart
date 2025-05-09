import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/cart_controller.dart'; // استورد الـ CartController

class CusttomListItems extends StatelessWidget {
  final String image;
  final String price;
  final String title;
  final String description;
  final double rating;
  final void Function()? onTap;

  CusttomListItems({
    required this.image,
    required this.price,
    required this.title,
    required this.description,
    required this.rating,
    this.onTap,
  });

  final FavoriteController favoriteController = Get.find<FavoriteController>();
  final CartController cartController =
      Get.find<CartController>(); // احصل على الـ CartController

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Image.asset(image, fit: BoxFit.cover),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ), // اسم المنتج على اليسار
              Text(
                description,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ), // الوصف على اليسار
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ), // السعر باللون الأحمر
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      Text(' ($rating)'),
                    ],
                  ),
                  Obx(
                    () => IconButton(
                      icon: Icon(
                        favoriteController.isFavorite(title)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        favoriteController.toggleFavorite(title);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5), // مساحة للزر الجديد
              ElevatedButton(
                onPressed: () {
                  cartController.addItem(title); // إضافة المنتج للسلة
                  Get.snackbar(
                    'Success',
                    '$title added to cart!',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 30),
                ),
                child: const Text('Add to cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
