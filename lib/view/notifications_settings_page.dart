import 'package:ecommerce/controller/notifications_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsSettingsPage extends StatelessWidget {
  const NotificationsSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // هنا بنعمل نسخة من الـ NotificationsSettingsController
    final NotificationsSettingsController controller = Get.put(
      NotificationsSettingsController(),
    );
    return Scaffold(
      appBar: AppBar(title: const Text("إعدادات الإشعارات")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => SwitchListTile(
            title: const Text("تفعيل الإشعارات"),
            value: controller.areNotificationsEnabled.value,
            onChanged: controller.toggleNotifications,
          ),
        ),
      ),
    );
  }
}
