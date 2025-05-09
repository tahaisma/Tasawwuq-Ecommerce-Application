import 'package:ecommerce/controller/archive_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // هنا بنعمل نسخة من الـ ArchiveController
    final ArchiveController controller = Get.put(ArchiveController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Archive",
          style: TextStyle(color: AppColor.primaryColor),
        ),
      ),
      body: Obx(
        () =>
            controller.archivedItems.isEmpty
                ? const Center(child: Text("الأرشيف فارغ."))
                : ListView.builder(
                  itemCount: controller.archivedItems.length,
                  itemBuilder: (context, index) {
                    final item = controller.archivedItems[index];
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.description),
                        trailing: ElevatedButton(
                          onPressed: () => controller.restoreItem(item),
                          child: const Text(
                            "restoration",
                            style: TextStyle(color: AppColor.primaryColor),
                          ),
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
