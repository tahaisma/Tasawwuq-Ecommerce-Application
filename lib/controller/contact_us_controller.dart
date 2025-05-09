import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart'; // هنستخدمها بشكل وهمي

class ContactUsController extends GetxController {
  final String phoneNumber = "0123456789";
  final String email = "info@example.com";

  void callNumber() async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    print("الاتصال برقم: $phoneNumber (وهمي)");
    // try {
    //   await launchUrl(launchUri); // ده هيشتغل لو على جهاز حقيقي
    // } catch (e) {
    //   print("لا يمكن الاتصال: $e");
    // }
  }

  void sendEmail() async {
    final Uri emailLaunchUri = Uri(scheme: 'mailto', path: email);
    print("إرسال بريد إلكتروني إلى: $email (وهمي)");
    // try {
    //   await launchUrl(emailLaunchUri); // ده هيشتغل لو على جهاز حقيقي
    // } catch (e) {
    //   print("لا يمكن فتح البريد الإلكتروني: $e");
    // }
  }

  void sendMessage(String message) {
    print("Messages sent: $message (وهمي)");
    Get.snackbar("Sent", "Your message was sent successfully");
  }
}
