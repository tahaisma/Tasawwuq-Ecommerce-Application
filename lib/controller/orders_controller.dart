import 'package:get/get.dart';

class Order {
  final String orderId;
  final DateTime orderDate;
  final String status;

  Order({required this.orderId, required this.orderDate, required this.status});
}

class OrdersController extends GetxController {
  RxList<Order> orders =
      <Order>[
        Order(
          orderId: "ORD-123",
          orderDate: DateTime.now().subtract(const Duration(days: 2)),
          status: "Delivered ",
        ),
        Order(
          orderId: "ORD-456",
          orderDate: DateTime.now().subtract(const Duration(days: 5)),
          status: "Shipping ",
        ),
        Order(
          orderId: "ORD-789",
          orderDate: DateTime.now().subtract(const Duration(days: 10)),
          status: "Processing... ",
        ),
      ].obs;

  void trackOrder(String orderId) {
    print("تتبع الطلب برقم: $orderId");
    // هنا ممكن نضيف logic وهمي لعرض تفاصيل التتبع
  }
}
