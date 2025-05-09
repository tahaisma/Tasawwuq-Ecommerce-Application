import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

var logger = Logger();

abstract class SignupController extends GetxController {
  SignUp();
  goToSignIn();
}

class SignUpControllerImp extends SignupController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  SignUp() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      logger.i("Valid");
      Get.offNamed(AppRoute.verfiyCodeSignUp);
    } else {
      logger.w("Not Valid");
    }
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
