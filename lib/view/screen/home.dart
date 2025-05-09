import 'package:ecommerce/controller/home_controlle.dart';
import 'package:ecommerce/controller/items_controller.dart'; // استورد الـ ItemsControllerImp
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/view/widget/custtomappbar.dart';
import 'package:ecommerce/view/widget/home/custtomcardhome.dart';
import 'package:ecommerce/view/widget/home/custtomtitlehome.dart';
import 'package:ecommerce/view/widget/home/listcategorishome.dart';
import 'package:ecommerce/view/widget/home/listitemofferhome.dart';
import 'package:ecommerce/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemsControllerImp itemsController =
        Get.find<ItemsControllerImp>(); // احصل على الـ ItemsController

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
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              Custtomappbar(
                titleappbar: "49".tr,
                onPressedIcon: () {},
                onPressedSearch: () {
                  itemsController
                      .showAllItems(); // استدعاء دالة عرض الكل عند الضغط
                  Get.toNamed(
                    "items",
                  ); // الانتقال لصفحة الـ Items لعرض كل المنتجات
                },
              ),
              CusttomCardHome(title: "47".tr, body: "48".tr),
              const SizedBox(height: 2),
              CusttomTitleHome(title: "46".tr),
              const SizedBox(height: 15),
              const ListCategoriesHome(),
              const SizedBox(height: 2),
              CusttomTitleHome(title: "45".tr),
              const SizedBox(height: 15),
              ListItemsHome(),
              const SizedBox(height: 4),
              CusttomTitleHome(title: "44".tr),
              const SizedBox(height: 10),
              ListItemOfferHome(),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
