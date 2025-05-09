import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/items_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesPage extends StatelessWidget {
  final FavoriteController favoriteController = Get.find<FavoriteController>();
  final ItemsControllerImp itemsController = Get.find<ItemsControllerImp>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: Obx(() {
        final favoriteItems =
            itemsController.allItems
                .where(
                  (item) => favoriteController.favoriteProducts.contains(
                    item['title'],
                  ),
                )
                .toList();

        if (favoriteItems.isEmpty) {
          return const Center(child: Text('No products in favorites yet'));
        } else {
          return ListView.builder(
            itemCount: favoriteItems.length,
            itemBuilder: (context, index) {
              final item = favoriteItems[index];
              return ListTile(
                leading: SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset(item['image'], fit: BoxFit.contain),
                ),
                title: Text(
                  item['title'],
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
                subtitle: Text(
                  item['price'],
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 13,
                  ), // Price in red
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    favoriteController.toggleFavorite(item['title']);
                  },
                ),
                onTap: () {
                  Get.toNamed("productdetils", arguments: item);
                },
              );
            },
          );
        }
      }),
    );
  }
}
