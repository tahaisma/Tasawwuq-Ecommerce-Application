import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CostumBouttonLang extends StatelessWidget {
  final String textboutton;
  final void Function()? onPressed;
  const CostumBouttonLang({
    super.key,
    required this.textboutton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          textboutton,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
