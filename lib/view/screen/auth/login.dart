import 'package:ecommerce/controller/auth/login_controller.dart';
import 'package:ecommerce/core/functions/alertexitapp.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/coustombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/coustomtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/coustomtextformauth.dart';
import 'package:ecommerce/view/widget/auth/coustomtexttitalauth.dart';
import 'package:ecommerce/view/widget/auth/logoauth.dart';
import 'package:ecommerce/view/widget/auth/textsignup.dart'
    show CustomTextSignUpOrSignIn;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          '15'.tr,
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
                const LogoAuth(),
                const CostuomTextTitalAuth(text: 'welcome back'),

                const SizedBox(height: 15),
                const Coustomtextbodyauth(
                  text:
                      'sign in your email and password or continue with social media',
                ),
                const SizedBox(height: 30),
                CostuomTextFormAuth(
                  isNumber: false,

                  valid: (val) {
                    return validInput(val!, 5, 100, "email");
                  },
                  myController: controller.email,
                  hinttext: 'Enter Your Email',
                  labletext: 'Email',
                  iconData: Icons.email_outlined,
                  //mycontroller: null,
                ),
                GetBuilder<LoginControllerImp>(
                  builder:
                      (controller) => CostuomTextFormAuth(
                        obscureText: controller.isshowpassword,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                        isNumber: false,

                        valid: (val) {
                          return validInput(val!, 5, 30, "password");
                        },
                        myController: controller.password,
                        hinttext: 'Enter Your Password',
                        labletext: 'Password',
                        iconData: Icons.lock_outline,
                        //mycontroller: null,
                      ),
                ),
                InkWell(
                  onTap: () {
                    controller.goToForgetPassword();
                  },
                  child: Text(
                    "Forget Password",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.end,
                  ),
                ),

                CustomButtomAuth(
                  text: "Sign In",
                  onPressed: () {
                    controller.login();
                  },
                ),
                SizedBox(height: 30),
                CustomTextSignUpOrSignIn(
                  textone: "Don't have an account ? ",
                  texttwo: "SignUp",
                  onTap: () {
                    controller.goToSignUp();
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
