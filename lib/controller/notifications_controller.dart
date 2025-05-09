import 'package:get/get.dart';

class NotificationsController extends GetxController {
  RxInt notificationsCount = 0.obs;
  RxList<String> notifications = <String>[].obs; // List to store notifications

  @override
  void onInit() {
    super.onInit();
    // Adding some dummy notifications
    notifications.addAll([
      "A new product has been added to your shopping cart.",
      "Special offer! Discounts up to 50% on summer clothes.",
      "Reminder: You have an order under processing with ID #12345.",
      "Congratulations! You've received your daily login bonus.",
    ]);
    notificationsCount.value =
        notifications.length; // Update count based on notifications
  }

  void markAllAsRead() {
    notificationsCount.value = 0;
    notifications
        .clear(); // Clear notifications after reading (for this simple example)
    update(); // To notify the UI of the change
  }

  // Function to add a new notification (we can use this later if needed)
  void addNotification(String message) {
    notifications.add(message);
    notificationsCount.value = notifications.length;
  }
}
