import 'package:ecommerce/controller/auth/successsignup_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/auth/coustombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller = Get.put(
      SuccessSignUpControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Success",
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.copyWith(color: AppColor.gray),
        ),
      ),

      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: Color.fromARGB(255, 255, 133, 81),
              ),
            ),
            Text(
              "37".tr,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.copyWith(fontSize: 30),
            ),
            Text("38".tr),
            Spacer(),
            Container(
              width: double.infinity,
              child: CustomButtomAuth(
                text: "Go To Login",
                onPressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
