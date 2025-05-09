import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/view/widget/language/costumbouttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // تأكد من استيراد Get

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على الـ LocaleController
    final localeController = Get.find<LocaleController>();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // استخدام الترجمة مع .tr
            Text("1".tr, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 20),
            // زر تغيير اللغة إلى العربية
            CostumBouttonLang(
              textboutton: "42".tr,
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoute.onBoarding);
                localeController.changeLang("ar");
              },
            ),
            // زر تغيير اللغة إلى الإنجليزية
            CostumBouttonLang(
              textboutton: "41".tr,
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRoute.onBoarding);
                localeController.changeLang("en");
              },
            ),
          ],
        ),
      ),
    );
  }
}
