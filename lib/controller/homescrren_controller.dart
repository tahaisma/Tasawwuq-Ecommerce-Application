import 'package:ecommerce/view/all_products_page.dart';
import 'package:ecommerce/view/notifications_page.dart';
import 'package:ecommerce/view/screen/auth/setting.dart';
import 'package:ecommerce/view/screen/home.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const Home(),

    AllProductsPage(),

    NotificationsPage(),

    Settings(),
  ];

  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "products", "icon": Icons.grid_view},

    {"title": "Favorite", "icon": Icons.notifications_active_outlined},
    {"title": "settings", "icon": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
