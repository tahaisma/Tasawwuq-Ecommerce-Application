import 'package:ecommerce/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class VerifiycodesginupController extends GetxController {
  checkcode();
  goToSuccessSignUp();
}

class VerifiycodesginupControllerImp extends VerifiycodesginupController {
  late String verftcode;
  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoute.successSignUp);
  }

  @override
  checkcode() {}

  @override
  void onInit() {
    super.onInit();
  }
}
