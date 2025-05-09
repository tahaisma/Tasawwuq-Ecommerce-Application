import 'package:ecommerce/controller/productdetils_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    final String image = arguments['image'];
    final String title = arguments['title'];
    final String description = arguments['description'];
    final String price = arguments['price'];
    final double rating = arguments['rating'];

    ProductDetailsControllerImp controller = Get.put(
      ProductDetailsControllerImp(),
    );

    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 40,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: AppColor.secoundColor,
          onPressed: () {
            controller.addToCart(
              title,
            ); // استدعاء دالة addToCart للانتقال للسلة
          },
          child: const Text(
            "Add To Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
        builder:
            (controller) => ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Image.asset(image, width: 300, height: 300),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    description,
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Price: $price",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColor.secoundColor,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: controller.remove, // وظيفة تقليل العداد فقط
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      Text(
                        "${controller.countitems}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        onPressed: controller.add, // وظيفة زيادة العداد فقط
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Available Colors:",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Wrap(
                    spacing: 15,
                    children:
                        controller.subitems.map((e) {
                          Color color = Color(int.parse(e['color']));
                          bool isDarkColor =
                              ThemeData.estimateBrightnessForColor(color) ==
                              Brightness.dark;
                          Color textColor =
                              isDarkColor ? Colors.white : Colors.black;
                          return ChoiceChip(
                            label: Text(
                              e['name'],
                              style: TextStyle(color: textColor),
                            ),
                            selected: e['active'] == '1',
                            selectedColor: color,
                            checkmarkColor: textColor,
                            backgroundColor: color.withOpacity(0.4),
                            onSelected: (_) {
                              for (var i in controller.subitems) {
                                i['active'] = '0';
                              }
                              e['active'] = '1';
                              controller.update();
                            },
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
