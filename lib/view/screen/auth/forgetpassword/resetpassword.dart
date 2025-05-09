import 'package:ecommerce/controller/auth/resestpassword_controller.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/coustombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/coustomtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/coustomtextformauth.dart';
import 'package:ecommerce/view/widget/auth/coustomtexttitalauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResestpasswordControllerImp controller = Get.put(
      ResestpasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "ResetPassword",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: const Color.fromARGB(255, 98, 96, 96),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              const SizedBox(height: 30),

              CostuomTextTitalAuth(text: "New Password "),

              const SizedBox(height: 15),
              const Coustomtextbodyauth(text: 'Please Enter New Password'),
              const SizedBox(height: 40),

              CostuomTextFormAuth(
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
              CostuomTextFormAuth(
                isNumber: false,

                valid: (val) {
                  return validInput(val!, 5, 30, "password");
                },
                myController: controller.repassword,
                hinttext: 'Re Enter Your Password',
                labletext: 'Password',
                iconData: Icons.lock_outline,
                //mycontroller: null,
              ),
              CustomButtomAuth(
                text: "Save",
                onPressed: () {
                  controller.resetpassword();
                },
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
