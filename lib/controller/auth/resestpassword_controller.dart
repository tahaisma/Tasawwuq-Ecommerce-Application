import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

var logger = Logger();

abstract class ResestpasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
}

class ResestpasswordControllerImp extends ResestpasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController repassword;

  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRoute.successResetpassword);
  }

  @override
  resetpassword() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      logger.i("Valid");
      Get.offNamed(
        AppRoute.successResetpassword,
      ); // Navigate only if the form is valid
    } else {
      logger.w("Not Valid");
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }
}
