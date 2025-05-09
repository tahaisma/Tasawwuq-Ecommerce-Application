import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart'; // استيراد المسارات
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // تأخير الانتقال إلى صفحة اللغة
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoute.language); // استخدام Get.offNamed للانتقال
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/2.png', // تأكد من المسار الصحيح
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
