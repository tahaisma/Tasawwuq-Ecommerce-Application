import 'package:ecommerce/controller/orders_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // هنا بنعمل نسخة من الـ OrdersController
    final OrdersController controller = Get.put(OrdersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Requests",
          style: TextStyle(color: AppColor.primaryColor),
        ),
      ),
      body: Obx(
        () =>
            controller.orders.isEmpty
                ? const Center(child: Text("No requests."))
                : ListView.builder(
                  itemCount: controller.orders.length,
                  itemBuilder: (context, index) {
                    final order = controller.orders[index];
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text("Request number : ${order.orderId}"),
                        subtitle: Text(
                          "Order date: ${order.orderDate.toLocal().toString().split(' ')[0]}, Delivery status: ${order.status}",
                        ),
                        trailing: ElevatedButton(
                          onPressed: () => controller.trackOrder(order.orderId),
                          child: const Text(
                            "Track",
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
