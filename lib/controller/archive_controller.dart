import 'package:get/get.dart';

class ArchiveItem {
  final String name;
  final String description;

  ArchiveItem({required this.name, required this.description});
}

class ArchiveController extends GetxController {
  RxList<ArchiveItem> archivedItems =
      <ArchiveItem>[
        ArchiveItem(
          name: "Old Product 1",
          description: "Description of archived product 1",
        ),
        ArchiveItem(name: "Order #001", description: "Order archived on ..."),
        // إضافة المنتج الجديد هنا
        ArchiveItem(
          name: "Wireless Headphones - Sony WH-1000XM5",
          description:
              "Industry-leading noise cancellation with up to 30 hours of battery life and exceptional sound quality.",
        ),
      ].obs;

  void restoreItem(ArchiveItem item) {
    print("Restoring item: ${item.name}");
    archivedItems.remove(item);
    // Here you might add logic to move the item to another list
  }
}
