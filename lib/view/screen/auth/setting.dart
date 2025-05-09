import 'package:ecommerce/controller/setting_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text(
                  'Confirm exit',
                  style: TextStyle(color: AppColor.secoundColor),
                ),
                content: const Text('Are you sure you want to exit the app?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text(
                      'no',
                      style: TextStyle(color: AppColor.secoundColor),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text(
                      'yes',
                      style: TextStyle(color: AppColor.secoundColor),
                    ),
                  ),
                ],
              ),
        );
        return shouldPop ?? false;
      },
      child: Container(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 3),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: Get.width / 3,
                    color: AppColor.primaryColor,
                  ),
                  Positioned(
                    top: Get.width / 5.0,
                    child: Column(
                      // استخدام Column لترتيب الصورة والاسم
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.grey[300],
                            backgroundImage: AssetImage(AppImageAsset.avIcon),
                          ),
                        ),
                        const SizedBox(height: 8), // مسافة بين الصورة والاسم
                        const Text(
                          "Taha Esmail",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 110),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      onTap: () {
                        Get.toNamed(AppRoute.notificationsSettings);
                      },
                      trailing: const Icon(Icons.notifications_active_outlined),
                      title: const Text("Disable Notificatios"),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(AppRoute.ordersPage);
                      },
                      trailing: const Icon(Icons.delivery_dining_outlined),
                      title: const Text("Orders"),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(AppRoute.archivePage);
                      },
                      trailing: const Icon(Icons.archive_outlined),
                      title: const Text("Archive"),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(AppRoute.addressPage);
                      },
                      trailing: const Icon(Icons.location_on_outlined),
                      title: const Text("Address"),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(AppRoute.aboutUsPage);
                      },
                      trailing: const Icon(Icons.help_outline_rounded),
                      title: const Text("About us"),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(AppRoute.contactUsPage);
                      },
                      trailing: const Icon(Icons.phone_callback_outlined),
                      title: const Text("Contact us"),
                    ),
                    ListTile(
                      onTap: () {
                        controller.logout();
                      },
                      title: const Text("Logout"),
                      trailing: const Icon(Icons.exit_to_app),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
