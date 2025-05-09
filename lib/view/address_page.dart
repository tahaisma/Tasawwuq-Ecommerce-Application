import 'package:ecommerce/controller/address_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // هنا بنعمل نسخة من الـ AddressController
    final AddressController controller = Get.put(AddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Address",
          style: TextStyle(color: AppColor.primaryColor),
        ),
      ),
      body: Obx(
        () =>
            controller.addresses.isEmpty
                ? const Center(child: Text("لا يوجد عناوين."))
                : ListView.builder(
                  itemCount: controller.addresses.length,
                  itemBuilder: (context, index) {
                    final address = controller.addresses[index];
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(address.name),
                        subtitle: Text("${address.street}, ${address.city}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => controller.editAddress(address),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ), // هنا ضفنا color: Colors.red
                              onPressed:
                                  () => controller.deleteAddress(address),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
