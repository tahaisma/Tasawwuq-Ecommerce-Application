import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

var logger = Logger();

abstract class ForgetpasswordController extends GetxController {
  void checkemail();
  void goToVerfiyCode();
}

class ForgetpasswordControllerImp extends ForgetpasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;

  @override
  void goToVerfiyCode() {
    Get.offNamed(AppRoute.verfiyCode);
  }

  @override
  void checkemail() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      logger.i("Valid");
      Get.offNamed(AppRoute.verfiyCode); // Navigate only if the form is valid
    } else {
      logger.w("Not Valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
