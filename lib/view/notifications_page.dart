import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/notifications_controller.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NotificationsController notificationsController = Get.put(
      NotificationsController(),
    );

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
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notifications',
            style: TextStyle(color: AppColor.primaryColor),
          ),
        ),
        body: Obx(
          () => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'You have ${notificationsController.notificationsCount.value} new notifications.',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child:
                    notificationsController.notifications.isEmpty
                        ? const Center(child: Text('No new notifications'))
                        : ListView.builder(
                          itemCount:
                              notificationsController.notifications.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  notificationsController.notifications[index],
                                ),
                              ),
                            );
                          },
                        ),
              ),
              Padding(
                padding: const EdgeInsets.all(38.0),
                child: ElevatedButton(
                  onPressed: () {
                    notificationsController.markAllAsRead();
                  },
                  child: const Text(
                    'Mark All as Read',
                    style: TextStyle(color: AppColor.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
