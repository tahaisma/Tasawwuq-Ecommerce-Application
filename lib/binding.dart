import 'package:ecommerce/controller/about_us_controller.dart';
import 'package:ecommerce/controller/address_controller.dart';
import 'package:ecommerce/controller/archive_controller.dart';
import 'package:ecommerce/controller/auth/signup_controller.dart';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/contact_us_controller.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/home_controlle.dart';
import 'package:ecommerce/controller/items_controller.dart'; // ← استيراد الـ ItemsControllerImp
import 'package:ecommerce/controller/notifications_controller.dart';
import 'package:ecommerce/controller/notifications_settings_controller.dart';
import 'package:ecommerce/controller/orders_controller.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
    Get.lazyPut(() => HomeControllerImp(), fenix: true);
    Get.lazyPut(
      () => ItemsControllerImp(),
      fenix: true,
    ); // ← إضافة الـ ItemsControllerImp هنا
    Get.lazyPut(() => FavoriteController(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);
    Get.lazyPut(() => NotificationsController());
    Get.lazyPut(() => NotificationsSettingsController());
    Get.lazyPut(() => OrdersController());
    Get.lazyPut(() => ArchiveController());
    Get.lazyPut(() => AddressController());
    Get.lazyPut(() => AboutUsController());
    Get.lazyPut(() => ContactUsController());
  }
}
