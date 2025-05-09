import 'package:ecommerce/controller/about_us_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AboutUsController controller = Get.put(AboutUsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Us",
          style: TextStyle(color: AppColor.primaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 22,
                ), // ده الـ style الأساسي للنص كله
                children: <TextSpan>[
                  const TextSpan(
                    text: 'App Name: ',
                    style: TextStyle(color: AppColor.black),
                  ), // الجزء الثابت من النص
                  TextSpan(
                    text: '${controller.appName}', // اسم التطبيق المتغير
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          AppColor
                              .primaryColor, // استخدم لون ثانوي من الـ Theme أو أي لون تختاره
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text("Version: ${controller.version}"),
            const SizedBox(height: 20),
            const Text(
              "Tasawwuq: Your ultimate shopping destination.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            Text(
              controller.copyright,
              style: const TextStyle(color: Color.fromARGB(255, 97, 96, 96)),
            ),
          ],
        ),
      ),
    );
  }
}
