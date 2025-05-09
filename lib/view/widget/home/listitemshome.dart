import 'package:ecommerce/controller/home_controlle.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  ListItemsHome({super.key});

  List<String> productImages = [
    'assets/images/laptop.png',
    'assets/images/s.png',
    'assets/images/d.png',
    'assets/images/1.png',
    'assets/images/5.png',
  ];
  List<String> productNames = [
    'Laptop Surface Go 2',
    'Running Shoes',
    'Smart Dress',
    'Mobile Iphone',
    'Camera Pro',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: productImages.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return ItemsHome(index: i);
        },
      ),
    );
  }
}

// تأكد من المسار الصحيح

class ItemsHome extends StatelessWidget {
  final int index;

  ItemsHome({super.key, required this.index});

  static final List<String> productImages = [
    'assets/images/laptop.png',
    'assets/images/s.png',
    'assets/images/d.png',
    'assets/images/1.png',
    'assets/images/5.png',
    'assets/images/sw.png',
  ];

  static final List<String> productNames = [
    'Laptop Surface Go 2',
    'Running Shoes',
    'Smart Dress',
    'Mobile iPhone',
    'Camera Pro',
    'Smart Watch',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 50),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Image.asset(
            productImages[index],
            height: 160,
            width: 230,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColor.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          height: 210,
          width: 270,
        ),
        Positioned(
          left: 20,
          top: 15,
          child: Text(
            productNames[index],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
