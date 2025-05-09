import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
  goToItems(List categories, int selectedCat);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? username;
  String? id;

  List categories = ['shose', 'dress', 'laptop', 'mobile', 'camera'];
  List items = [];

  @override
  goToItems(categories, selectedCat) {
    Get.toNamed(
      AppRoute.items,
      arguments: {"categories": categories, "selectedcat": selectedCat},
    );
  }

  @override
  getdata() {
    // تحميل البيانات
  }

  @override
  initialData() {
    // تهيئة
  }
}
