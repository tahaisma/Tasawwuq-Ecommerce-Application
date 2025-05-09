import 'package:ecommerce/controller/home_controlle.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ListItemOfferHome extends GetView<HomeControllerImp> {
  ListItemOfferHome({super.key});

  List<String> productImages = ['assets/images/sw.png'];
  List<String> productNames = ['Smart watch discount 20%'];
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

  static final List<String> productImages = ['assets/images/sw.png'];

  static final List<String> productNames = ['Smart watch discount 20%'];

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
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
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
