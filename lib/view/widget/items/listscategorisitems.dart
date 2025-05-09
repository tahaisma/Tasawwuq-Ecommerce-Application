import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart' show AppImageAsset;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  static final List<String> categoryImages = [
    AppImageAsset.shoIcon,
    AppImageAsset.dreIcon,
    AppImageAsset.lapIcon,
    AppImageAsset.mobIcon,
    AppImageAsset.camIcon,
  ];

  static final List<String> categoryNames = [
    'shose',
    'dress',
    'laptop',
    'mobile',
    'camera',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: categoryNames.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index >= categoryNames.length || index >= categoryImages.length) {
            return const SizedBox(); // حماية من خطأ الوصول
          }

          return CategoriseModel(
            index: index,
            i: index,
            name: categoryNames[index],
            image: categoryImages[index],
          );
        },
      ),
    );
  }
}

class CategoriseModel extends GetView<ItemsControllerImp> {
  final int index;
  final int? i;
  final String name;
  final String image;

  const CategoriseModel({
    super.key,
    required this.index,
    required this.i,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changCat(i!);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GetBuilder<ItemsControllerImp>(
              builder:
                  (controller) => Container(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 10,
                      bottom: 10,
                    ),
                    decoration:
                        controller.selectedCat == i
                            ? const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 3,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            )
                            : null,
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 94, 94, 94),
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
