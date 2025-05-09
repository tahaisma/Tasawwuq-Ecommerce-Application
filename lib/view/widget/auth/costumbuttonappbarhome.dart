import 'package:ecommerce/controller/homescrren_controller.dart';
import 'package:ecommerce/view/widget/auth/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonAppBarHome extends StatelessWidget {
  const CustomButtonAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder:
          (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 15.0,
            child: ConstrainedBox(
              // استخدام ConstrainedBox للتحكم في الارتفاع الأقصى
              constraints: const BoxConstraints(
                maxHeight: 50.0,
              ), // تحديد أقصى ارتفاع
              child: Row(
                children: [
                  ...List.generate(controller.listPage.length + 1, (index) {
                    if (index == 2) return const Spacer();
                    int adjustedIndex = index > 2 ? index - 1 : index;
                    return CustomButtonAppBar(
                      iconData: controller.bottomappbar[adjustedIndex]['icon'],
                      onPressed: () {
                        controller.changePage(adjustedIndex);
                      },
                      active: controller.currentpage == adjustedIndex,
                    );
                  }),
                ],
              ),
            ),
          ),
    );
  }
}
