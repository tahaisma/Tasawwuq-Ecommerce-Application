import 'package:ecommerce/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class VerfyController extends GetxController {
  checkcode();
  goToResetPassword();
}

class VerfyControllerImp extends VerfyController {
  late String verftcode;
  @override
  goToResetPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }

  @override
  checkcode() {}

  @override
  void onInit() {
    super.onInit();
  }
}
