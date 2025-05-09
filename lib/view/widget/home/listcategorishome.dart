import 'package:ecommerce/controller/home_controlle.dart';
import 'package:ecommerce/core/constant/imageasset.dart' show AppImageAsset;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  // بيانات التصنيفات (صور وأسماء)
  static final List<Map<String, String>> categories = [
    {"name": "50".tr, "image": AppImageAsset.shoIcon},
    {"name": "51".tr, "image": AppImageAsset.dreIcon},
    {"name": "52".tr, "image": AppImageAsset.lapIcon},
    {"name": "53".tr, "image": AppImageAsset.mobIcon},
    {"name": "54".tr, "image": AppImageAsset.camIcon},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoriseModel(
            index: index,
            name: category["name"]!,
            image: category["image"]!,
          );
        },
      ),
    );
  }
}

class CategoriseModel extends GetView<HomeControllerImp> {
  final int index;
  final String name;
  final String image;

  const CategoriseModel({
    super.key,
    required this.index,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, index);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 249, 187, 181),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  color: const Color.fromARGB(255, 168, 34, 19),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
