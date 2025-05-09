import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/constant/routes.dart'; // استورد ملف الـ routes الثوابت
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custtomappbar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIcon; // ممكن نستخدمه لأيقونة تانية لو عايزين
  final void Function()? onPressedSearch;

  const Custtomappbar({
    super.key,
    required this.titleappbar,
    this.onPressedIcon,
    this.onPressedSearch,
  });

  @override
  Widget build(BuildContext context) {
    final ItemsControllerImp itemsController = Get.find<ItemsControllerImp>();

    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: itemsController.searchController,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed:
                      onPressedSearch, // استدعاء onPressedSearch عند الضغط على أيقونة البحث
                  icon: const Icon(Icons.search),
                ),
                hintText: titleappbar,
                hintStyle: const TextStyle(fontSize: 13),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(13),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.grey[200],
            ),
            width: 55,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
              onPressed: () {
                Get.toNamed(
                  AppRoute.favorite,
                ); // الانتقال لصفحة المفضلة عند الضغط
              },
              icon: const Icon(Icons.favorite_border_outlined, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
