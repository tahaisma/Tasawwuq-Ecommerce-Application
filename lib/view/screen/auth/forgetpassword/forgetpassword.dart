import 'package:ecommerce/controller/auth/forgetpassword_controller.dart';
import 'package:ecommerce/core/functions/validinput.dart';
import 'package:ecommerce/view/widget/auth/coustombuttonauth.dart';
import 'package:ecommerce/view/widget/auth/coustomtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/coustomtextformauth.dart';
import 'package:ecommerce/view/widget/auth/coustomtexttitalauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetpasswordControllerImp controller = Get.put(
      ForgetpasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          '14'.tr,
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
              CostuomTextTitalAuth(text: "Check Email"),

              const SizedBox(height: 15),
              const Coustomtextbodyauth(
                text:
                    'please Enter Your Email Address To Recive A verification code',
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

              CustomButtomAuth(
                text: "check",
                onPressed: () {
                  controller.checkemail();
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
