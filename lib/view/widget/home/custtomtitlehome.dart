import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CusttomTitleHome extends StatelessWidget {
  const CusttomTitleHome({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        color: AppColor.secoundColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
