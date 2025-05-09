import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final IconData iconData;
  final void Function()? onPressed;
  final bool active;

  const CustomButtonAppBar({
    Key? key,

    required this.iconData,
    this.onPressed,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: 70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: active ? AppColor.secoundColor : Colors.grey[600],
            size: 26, // 👈 تصغير حجم الأيقونة
          ),
          // Text(
          // textbutton,
          //style: TextStyle(
          //color: active ? AppColor.secoundColor : Colors.grey,
          //fontSize: 12, // 👈 تصغير حجم الخط
          //),
          //),
        ],
      ),
    );
  }
}
