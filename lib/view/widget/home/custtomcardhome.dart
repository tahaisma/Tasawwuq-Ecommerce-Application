import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CusttomCardHome extends StatelessWidget {
  final String title;
  final String body;
  const CusttomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 150,
      child: Stack(
        children: [
          // خلفية البطاقة (البرواز)
          Container(
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          // الدائرة فوق البرواز وتحت الكلام
          Positioned(
            top: -14,
            right: -23,
            child: Container(
              height: 150,
              width: 170,
              decoration: BoxDecoration(
                color: AppColor.secoundColor,
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          ),
          // النصوص (أعلى كل شيء)
          Center(
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 19),
              ),
              subtitle: Text(
                body,
                style: const TextStyle(color: Colors.white, fontSize: 34),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
