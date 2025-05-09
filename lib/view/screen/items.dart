import 'package:ecommerce/controller/items_controller.dart';
import 'package:ecommerce/view/widget/custtomappbar.dart';
import 'package:ecommerce/view/widget/items/custtomlistitems.dart';
import 'package:ecommerce/view/widget/items/listscategorisitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    // الوصول إلى الـ ItemsControllerImp اللي تم إنشاؤه بالفعل
    final ItemsControllerImp controller = Get.find<ItemsControllerImp>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custtomappbar(
                titleappbar: 'Find Product',
                onPressedIcon: () {},
                onPressedSearch: () {
                  controller.showAllItems(); // استدعاء دالة عرض الكل هنا
                },
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 60, child: ListCategoriesItems()),
              const SizedBox(height: 10),
              Expanded(
                child: Obx(() {
                  print(
                    "Number of items in currentItems: ${controller.currentItems.length}",
                  ); // أضف هذا السطر للتأكد
                  return GridView.builder(
                    itemCount: controller.currentItems.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.5,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                    itemBuilder: (context, index) {
                      final item = controller.currentItems[index];
                      return CusttomListItems(
                        image: item['image'],
                        price: item['price'],
                        title: item['title'],
                        description: item['description'],
                        rating: item['rating'],
                        onTap: () {
                          Get.toNamed("productdetils", arguments: item);
                        },
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
