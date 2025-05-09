import 'package:get/get.dart';

class NotificationsSettingsController extends GetxController {
  RxBool areNotificationsEnabled = true.obs;

  void toggleNotifications(bool value) {
    areNotificationsEnabled.value = value;
    // هنا ممكن نضيف أي logic لحفظ حالة الإشعارات (ولو بشكل وهمي دلوقتي)
    print("Notifications are now ${value ? 'enabled' : 'disabled'}");
  }
}
