import 'package:ecommerce/controller/contact_us_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactUsController controller = Get.put(ContactUsController());
    final TextEditingController messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contact Us",
          style: TextStyle(color: AppColor.primaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "You can contact us via:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text(controller.phoneNumber),
              onTap: controller.callNumber,
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(controller.email),
              onTap: controller.sendEmail,
            ),
            const SizedBox(height: 20),
            const Text("Or send us a message:", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            TextFormField(
              controller: messageController,
              maxLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Your Message",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => controller.sendMessage(messageController.text),
              child: const Text(
                "Send Message",
                style: TextStyle(color: AppColor.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
