import 'package:ecommerce/controller/auth/verfy_controller.dart';
import 'package:ecommerce/view/widget/auth/coustomtextbodyauth.dart';
import 'package:ecommerce/view/widget/auth/coustomtexttitalauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Verfiycode extends StatelessWidget {
  const Verfiycode({super.key});

  @override
  Widget build(BuildContext context) {
    VerfyControllerImp controller = Get.put(VerfyControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Verification Code",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: const Color.fromARGB(255, 98, 96, 96),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
        child: ListView(
          children: [
            CostuomTextTitalAuth(text: "Check Code"),

            const SizedBox(height: 15),
            const Coustomtextbodyauth(
              text: 'Please Enter The Digit code Sent To taha@gmail.com ',
            ),
            const SizedBox(height: 30),

            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                controller.goToResetPassword();
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
