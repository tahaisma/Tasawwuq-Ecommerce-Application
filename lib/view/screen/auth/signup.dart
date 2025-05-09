import 'package:ecommerce/controller/auth/signup_controller.dart';
import 'package:ecommerce/core/functions/alertexitapp.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/coustombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/coustomtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/coustomtextformauth.dart';
import 'package:ecommerce/view/widget/auth/coustomtexttitalauth.dart';
import 'package:ecommerce/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    // يجب أن يتم إضافة Get.find أو Get.put لتوصيل الـ controller
    final controller = Get.put(SignUpControllerImp());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          '17'.tr,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: const Color.fromARGB(255, 98, 96, 96),
          ),
        ),
      ),

      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                const CostuomTextTitalAuth(text: 'Welcome back'),

                const SizedBox(height: 15),
                const Coustomtextbodyauth(
                  text:
                      'Sign Up With Your Email And Password OR Continue With Social Media',
                ),
                const SizedBox(height: 30),
                CostuomTextFormAuth(
                  isNumber: false,
                  valid: (val) => validInput(val!, 2, 100, "20".tr),
                  myController: controller.username,
                  hinttext: '23'.tr,
                  labletext: 'User Name',
                  iconData: Icons.person_outline,
                ),

                CostuomTextFormAuth(
                  isNumber: false,
                  valid: (val) => validInput(val!, 5, 100, "email"),
                  myController: controller.email,
                  hinttext: 'Enter Your Email',
                  labletext: 'Email',
                  iconData: Icons.email_outlined,
                ),
                CostuomTextFormAuth(
                  isNumber: true,
                  valid: (val) => validInput(val!, 11, 11, "phone"),
                  myController: controller.phone,
                  hinttext: 'Enter Your Phone',
                  labletext: 'Phone',
                  iconData: Icons.phone_outlined,
                ),
                CostuomTextFormAuth(
                  isNumber: false,
                  valid: (val) => validInput(val!, 5, 30, "password"),
                  myController: controller.password,
                  hinttext: 'Enter Your Password',
                  labletext: 'Password',
                  iconData: Icons.lock_outline,
                ),

                CustomButtomAuth(
                  text: "Sign Up",
                  onPressed: () {
                    controller.SignUp();
                  },
                ),
                const SizedBox(height: 30),
                CustomTextSignUpOrSignIn(
                  textone: "Have an account? ",
                  texttwo: "Sign In",
                  onTap: () {
                    controller.goToSignIn();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
