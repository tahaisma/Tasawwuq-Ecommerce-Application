import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';

import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
